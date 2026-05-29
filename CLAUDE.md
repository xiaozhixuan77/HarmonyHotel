# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

HarmonyOS smart hotel room control app (智慧客房) — hotel guests control room devices (lights, AC, curtains) and request services (cleaning, do-not-disturb, SOS) from a phone/tablet/foldable. This is a coursework project built with Claude Code.

**Tech stack:** ArkTS + ArkUI on HarmonyOS SDK 6.0.2 (API 22), Stage mode, Hvigor build system.
**Target devices:** phone, tablet, 2in1.

## Build & Test Commands

Build and test happen inside DevEco Studio (HarmonyOS IDE). There is no CLI build.

- **Build:** Open `HonySystem/` in DevEco Studio → Build → Build HAP(s)
- **Run on emulator/device:** Run → Run 'default'
- **Run unit tests:** Right-click `products/default/src/test/` → Run 'LocalUnit.test.ets'
- **Run instrumented tests:** Right-click `products/default/src/ohosTest/` → Run
- **Lint:** DevEco Studio auto-lints `.ets` files using rules in `code-linter.json5`

### Test Framework

Hypium (`@ohos/hypium` 1.0.25) with Hamock (`@ohos/hamock` 1.0.0) for mocking. Tests use `describe`/`it`/`expect` API. Register test suites in `List.test.ets`.

Unit test files in `products/default/src/test/`:
- `LocalUnit.test.ets` — scaffold dummy
- `CommonUtils.test.ets` — utils tests
- `MockApi.test.ets` — mock API tests
- `LoginViewModel.test.ets`, `HomeViewModel.test.ets`, `LightViewModel.test.ets`, `CurtainViewModel.test.ets`, `ServiceViewModel.test.ets` — ViewModel logic tests
- `BreakpointUtil.test.ets` — breakpoint utility tests

Instrumented test files in `products/default/src/ohosTest/ets/test/`:
- `Ability.test.ets` — scaffold dummy
- `LoginPage.test.ets`, `HomePage.test.ets`, `LightPage.test.ets`, `CurtainPage.test.ets`, `ServicePage.test.ets`, `ProductPage.test.ets` — UI/page tests

## Multi-Module Architecture

The project uses HarmonyOS multi-module HAR/HSP architecture, not a monolithic entry module.

**Modules declared in `build-profile.json5`:**

| Module | Path | Package name | Role |
|--------|------|--------------|------|
| `common` | `./common` | `@ohos/common` | Shared library: API, models, mocks, utils, components, resources |
| `login` | `./features/login` | `@ohos/login` | Login feature HAR |
| `home` | `./features/home` | `@ohos/home` | Home feature HAR |
| `light` | `./features/light` | `@ohos/light` | Light feature HAR |
| `curtain` | `./features/curtain` | `@ohos/curtain` | Curtain feature HAR |
| `service` | `./features/service` | `@ohos/service` | Service feature HAR |
| `default` | `./products/default` | `default` | Entry HAP: Navigation root + layout dispatch |

Cross-module imports use package names declared in each module's `oh-package.json5`:
```typescript
import { getBreakpoint } from '@ohos/common';
import { HomeView } from '@ohos/home';
```

Each feature module declares `"@ohos/common": "file:../../common"` as a dependency. The `default` entry module depends on all feature modules and `common`.

### Feature Module Internal Structure

Each feature HAR follows a consistent internal directory structure:

```
features/{name}/src/main/ets/
├── View/
│   ├── {Name}View.ets              # Root view component
│   └── components/                 # Sub-components
├── ViewModel/
│   └── {Name}ViewModel.ets         # Business logic + state
└── Model/
    └── {Name}Model.ets             # (login only) Data interfaces
```

Exported via `features/{name}/Index.ets`:
```typescript
export * from './src/main/ets/View/LoginView';
export * from './src/main/ets/ViewModel/LoginViewModel';
export * from './src/main/ets/Model/LoginModel';
```

### Resources Are Distributed

Unlike the previous monolithic resource model, each module now owns its own `src/main/resources/`:
- `common/src/main/resources/` — shared colors, dimensions, tab icons
- `features/*/src/main/resources/` — feature-specific strings, colors, media
- `products/default/src/main/resources/` — entry-level assets (launch icons, backgrounds)

When a HAR component uses `$r('app.media.xxx')`, it resolves against **the calling HAP's** resource context (`products/default`). For strings/colors defined in a HAR, DevEco Studio merges them at build time.

## Architecture

**Pattern:** MVVM (Model-View-ViewModel) with ArkUI V2 state management decorators.

**Navigation:** `Navigation` + `NavPathStack` component-based navigation (not `router` API).

- `EntryAbility` loads `pages/Index` via `windowStage.loadContent`
- `pages/Index` creates a `NavPathStack`, wraps it in `Navigation`, and pushes `LoginPage`
- `LoginPage` (entry wrapper) renders `LoginView` from `@ohos/login`; on success calls `pageStack.replacePath({ name: 'MainPage' })`
- `MainPage` (entry wrapper) renders the breakpoint-based layout; logout calls `pageStack.replacePath({ name: 'LoginPage' })`

All navigation destinations are registered in `Index`'s `PageMap` builder. `main_pages.json` only lists `pages/Index`.

**Three-layer structure:**
- `common/src/main/ets/` — ApiService, data models, mock data, utils, shared components
- `features/{login,home,light,curtain,service}/src/main/ets/` — feature modules: `View/` + `ViewModel/` + `Model/` + `View/components/`
- `products/default/src/main/ets/product/{phone,tablet,foldable}/` — device-specific layout assembly: `MainLayout.ets`

**State flow:** `EntryAbility` → `Index` → `LoginPage` (wrapper) → `LoginView` → (auto-login) → `MainPage` (wrapper) → `Phone/Tablet/FoldableMainLayout` → tab `View`s each instantiate their own ViewModel.

### V2 State Management

All UI components and ViewModels use ArkUI V2 decorators:
- `@ComponentV2` — V2 component decorator
- `@Local` — component-local reactive state
- `@Param` — parent-to-child one-way sync
- `@Event` — child-to-parent event callback
- `@ObservedV2` / `@Trace` — observable class instances with nested reactivity (used on all ViewModels)
- `@Provider` / `@Consumer` — dependency injection for shared objects (used for `NavPathStack`)

Do not mix V1 decorators (`@State`, `@Prop`, `@Link`, `@Observed`) with V2 code.

### Breakpoint System

`BreakpointUtil.getBreakpoint(width)` returns:
- `'sm'` — width < 600 vp (phone)
- `'md'` — 600 <= width < 840 vp (tablet)
- `'lg'` — width >= 840 vp (foldable)

`MainPage` listens to `windowSizeChange` and switches layout accordingly.

### Mock Data Injection

Every ViewModel declares its API as a public property with a default mock assignment. This enables easy test injection:

```typescript
@ObservedV2
export class LoginViewModel {
  loginApi: (roomNo: string, firstName: string) => Promise<ApiResponse<string>> = mockLogin;
  // ...
}
```

Tests replace `vm.loginApi` with a stub before calling the method under test.

## Key Files

| Path | Role |
|------|------|
| `products/default/src/main/ets/entryability/EntryAbility.ets` | App entry; loads `pages/Index`; sets full-screen layout; exposes `STATUS_BAR_HEIGHT` |
| `products/default/src/main/ets/pages/Index.ets` | Navigation root; owns `NavPathStack` via `@Provider`; registers `PageMap` for `LoginPage` / `MainPage` |
| `products/default/src/main/ets/login/LoginPage.ets` | Entry wrapper for `LoginView`; `@Consumer('pageStack')`; calls `replacePath({ name: 'MainPage' })` on success |
| `products/default/src/main/ets/pages/MainPage.ets` | Breakpoint detection + layout dispatch; `@Consumer('pageStack')`; handles logout navigation |
| `products/default/src/main/ets/product/phone/MainLayout.ets` | Phone layout: bottom custom tab bar over `Tabs` |
| `products/default/src/main/ets/product/tablet/MainLayout.ets` | Tablet layout: left nav rail + right content |
| `products/default/src/main/ets/product/foldable/MainLayout.ets` | Foldable layout: wide nav + wide content |
| `features/login/src/main/ets/View/LoginView.ets` | Login UI (roomNo + firstName + rememberMe) |
| `features/login/src/main/ets/ViewModel/LoginViewModel.ets` | Login logic, auto-login, Preferences persistence |
| `features/login/src/main/ets/Model/LoginModel.ets` | Login data model interface |
| `features/home/src/main/ets/View/HomeView.ets` | Home tab: AC control, scene modes, service status |
| `features/home/src/main/ets/ViewModel/HomeViewModel.ets` | Home tab logic |
| `features/light/src/main/ets/View/LightView.ets` | Light tab: master switch, 5 scene modes, 9 independent lights |
| `features/light/src/main/ets/ViewModel/LightViewModel.ets` | Light tab logic |
| `features/curtain/src/main/ets/View/CurtainView.ets` | Curtain tab: all open/close, curtain1, window screening |
| `features/curtain/src/main/ets/ViewModel/CurtainViewModel.ets` | Curtain tab logic |
| `features/service/src/main/ets/View/ServiceView.ets` | Service tab: DND, clean room, SOS, logout |
| `features/service/src/main/ets/ViewModel/ServiceViewModel.ets` | Service tab logic |
| `common/src/main/ets/api/ApiService.ets` | HTTP wrapper (GET/POST), token auth, error toasts, 401 redirect callback |
| `common/src/main/ets/model/DeviceModels.ets` | Data interfaces: `RoomState`, `Hardware`, `AirConditioner`, `Light`, `LightMode`, `Curtain`, `Service`, `StateFlags` |
| `common/src/main/ets/mock/` | `MockLogin.ets`, `MockRoomState.ets`, `MockLight.ets`, `MockAircon.ets` |
| `common/src/main/ets/utils/PreferencesUtil.ets` | Token and login info persistence via `@ohos.data.preferences` |
| `common/src/main/ets/utils/DebounceUtil.ets` | Debounce helper |
| `common/src/main/ets/utils/BreakpointUtil.ets` | Breakpoint calculation |
| `common/src/main/ets/components/TabBar.ets` | `TabItemConfig` interface + `TAB_CONFIGS` array |
| `products/default/src/main/module.json5` | Module manifest: deviceTypes `["phone", "tablet", "2in1"]`, `ohos.permission.INTERNET` |
| `products/default/src/main/resources/base/profile/main_pages.json` | Page routes: `pages/Index` only |
| `build-profile.json5` | SDK 6.0.2(22), HarmonyOS runtime, debug + release modes |
| `code-linter.json5` | ETS/TS + `@performance/recommended` + `@typescript-eslint/recommended` + security crypto rules |
| `oh-package.json5` | Dev deps: `@ohos/hypium` 1.0.25, `@ohos/hamock` 1.0.0 |

## API Backend

Reference information from the project API docs — used for mock data design.

Base URL: `https://ohosiot.admitpro.cn`. Bearer token auth via `/api/sso/login`.

| Endpoint | Purpose |
|----------|---------|
| `POST /api/sso/login` | Login with `roomNo` + `firstName`, returns JWT token |
| `POST /api/rcu/room/getState` | Get full room state (lights, AC, curtains, services) |
| `POST /api/rcu/room/setLightMode` | Set light mode by `hardwareId` |
| `POST /api/rcu/room/clickAirBtn` | Control AC: temp (16-30), mode, speed, power |

Response format: `{ code: number, msg: string, data: any, success: boolean }`. Code `0` = success.

Full API docs at `E:\HarmonyHotel\资料\智慧客房接口文档.md`.
Project design doc at `E:\HarmonyHotel\资料\项目设计书\项目设计书.md` (contains hardware IDs, data models, error handling, test plans).

**For development, use mock data only** (coursework requirement). Mock responses live in `common/src/main/ets/mock/`.

### Key Hardware IDs

| Type | ID | Name |
|------|-----|------|
| Light all-on | 103001 | 明亮模式（全开） |
| Light all-off | 103004 | 总关模式 |
| Light mode | 103119 ~ 103123 | 明亮/柔和/阅读/温馨/睡眠 |
| Lights | 103125, 103128~103135 | 洗漱间/衣柜灯/落地灯/吧灯/书桌灯/右阅读灯/左阅读灯/排风扇/廊灯 |
| AC | 103136 | 空调1 (kt1) |
| Curtain | 103137 | 窗帘1 |
| Window screen | 103127 | 窗纱 |
| Service DND | 103138 | 请勿打扰 (wurao) |
| Service clean | 103139 | 清理房间 (qingli) |

## Error Handling

Centralized in `common/src/main/ets/api/ApiService.ets`:
- HTTP 401 → clear token + call `onUnauthorized` callback + Toast "登录已过期，请重新登录"
- HTTP 403 → Toast "权限不足，请联系前台"
- HTTP 404 → Toast "服务暂不可用"
- HTTP 500 → Toast "服务器繁忙，请稍后再试"
- Business `code !== 0` → Toast `msg`
- Network error/timeout → Toast "网络连接失败"

## Resources

Resources are distributed across modules:
- Strings: `features/*/src/main/resources/base/element/string.json`, `common/src/main/resources/base/element/string.json`, `products/default/src/main/resources/base/element/string.json`
- Colors: `features/*/src/main/resources/base/element/color.json`, `common/src/main/resources/base/element/color.json`, `products/default/src/main/resources/base/element/color.json`
- Dimensions: `features/*/src/main/resources/base/element/float.json`, `common/src/main/resources/base/element/float.json`, `products/default/src/main/resources/base/element/float.json`
- Media: `features/*/src/main/resources/base/media/`, `common/src/main/resources/base/media/`, `products/default/src/main/resources/base/media/`
- Layout dimensions use `fp` (font-relative pixels) and `vp` (virtual pixels)

## Git

Project is managed with git (`HonySystem/.gitignore`). The `.hvigor/`, `oh_modules/`, `build/`, `.idea/`, and `local.properties` directories are gitignored. Do not commit these.

Commit convention: `type(scope): subject` (feat/fix/test/refactor/docs/style/chore). Each module commit should include its deliverable and test reports under `E:\HarmonyHotel\reports\`.

## Coursework Constraints

From `E:\HarmonyHotel\资料\课内实训.md`:
- Must use MVVM + V2 state management + three-layer architecture
- Mock data only during development (no live API calls required)
- Must support phone, tablet, and foldable layouts
- Keep git history clean — commit logical units
- Export chat history alongside code for submission
