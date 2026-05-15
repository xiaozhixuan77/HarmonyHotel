# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

HarmonyOS smart hotel room control app (智慧客房) — hotel guests control room devices (lights, AC, curtains) and request services (cleaning, do-not-disturb, SOS) from a phone/tablet/foldable. This is a coursework project built with Claude Code.

**Tech stack:** ArkTS + ArkUI on HarmonyOS SDK 6.0.2 (API 22), Stage mode, Hvigor build system.
**Target devices:** phone, tablet, 2in1.

## Build & Test Commands

Build and test happen inside DevEco Studio (HarmonyOS IDE). There is no CLI build.

- **Build:** Open `HonySystem/` in DevEco Studio → Build → Build HAP(s)
- **Run on emulator/device:** Run → Run 'entry'
- **Run unit tests:** Right-click `entry/src/test/` → Run 'LocalUnit.test.ets'
- **Run instrumented tests:** Right-click `entry/src/ohosTest/` → Run
- **Lint:** DevEco Studio auto-lints `.ets` files using rules in `code-linter.json5`

### Test Framework

Hypium (`@ohos/hypium` 1.0.25) with Hamock (`@ohos/hamock` 1.0.0) for mocking. Tests use `describe`/`it`/`expect` API. Register test suites in `List.test.ets` (local) and `ohosTest/ets/test/List.test.ets` (instrumented).

Unit test files in `entry/src/test/`:
- `LocalUnit.test.ets` — scaffold dummy
- `CommonUtils.test.ets` — utils tests
- `MockApi.test.ets` — mock API tests
- `LoginViewModel.test.ets`, `HomeViewModel.test.ets`, `LightViewModel.test.ets`, `CurtainViewModel.test.ets`, `ServiceViewModel.test.ets` — ViewModel logic tests
- `BreakpointUtil.test.ets` — breakpoint utility tests

Instrumented test files in `entry/src/ohosTest/ets/test/`:
- `Ability.test.ets` — scaffold dummy
- `LoginPage.test.ets`, `HomePage.test.ets`, `LightPage.test.ets`, `CurtainPage.test.ets`, `ServicePage.test.ets`, `ProductPage.test.ets` — UI/page tests

## Architecture

**Pattern:** MVVM (Model-View-ViewModel) with ArkUI V2 state management decorators.

**Navigation:** `EntryAbility` loads `feature/login/LoginPage` via `router.replaceUrl({ url: 'feature/main/MainPage' })`. No `Navigation`/`NavPathStack` is used — plain router API.

**Three-layer structure:**
- `common/` — ApiService, data models, mock data, utils (PreferencesUtil, DebounceUtil, BreakpointUtil), shared components (TabBar)
- `feature/` — feature modules: `login/`, `main/`, `home/`, `light/`, `curtain/`, `service/`. Each has its own Page + ViewModel + components.
- `product/` — device-specific layout assembly: `phone/MainLayout.ets`, `tablet/MainLayout.ets`, `foldable/MainLayout.ets`

**State flow:** `EntryAbility` → `LoginPage` → (auto-login check) → `MainPage` → selects `PhoneMainLayout`/`TabletMainLayout`/`FoldableMainLayout` based on breakpoint → tab pages each instantiate their own ViewModel. No global `@Provide/@Consume` is used; each page owns its ViewModel instance.

### V2 State Management

All UI components and ViewModels use ArkUI V2 decorators:
- `@ComponentV2` — V2 component decorator (used on all pages and layout structs)
- `@Local` — component-local reactive state (replaces `@State`)
- `@Param` — parent-to-child one-way sync (replaces `@Prop`)
- `@Event` — child-to-parent event callback (replaces `@Link` event pattern)
- `@ObservedV2` / `@Trace` — observable class instances with nested reactivity (used on all ViewModels)

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
| `entry/src/main/ets/entryability/EntryAbility.ets` | App entry; loads `feature/login/LoginPage`; sets full-screen layout |
| `entry/src/main/ets/feature/login/LoginPage.ets` | Login UI (roomNo + firstName + rememberMe) |
| `entry/src/main/ets/feature/login/LoginViewModel.ets` | Login logic, auto-login, Preferences persistence |
| `entry/src/main/ets/feature/main/MainPage.ets` | Breakpoint detection + layout dispatch |
| `entry/src/main/ets/feature/home/HomePage.ets` | Home tab: AC control, scene modes, service status |
| `entry/src/main/ets/feature/light/LightPage.ets` | Light tab: master switch, 5 scene modes, 9 independent lights |
| `entry/src/main/ets/feature/curtain/CurtainPage.ets` | Curtain tab: all open/close, curtain1, window screening |
| `entry/src/main/ets/feature/service/ServicePage.ets` | Service tab: DND, clean room, SOS, logout |
| `entry/src/main/ets/product/phone/MainLayout.ets` | Phone layout: bottom custom tab bar over `Tabs` |
| `entry/src/main/ets/product/tablet/MainLayout.ets` | Tablet layout: left nav rail + right content |
| `entry/src/main/ets/product/foldable/MainLayout.ets` | Foldable layout: wide nav + wide content |
| `entry/src/main/ets/common/api/ApiService.ets` | HTTP wrapper (GET/POST), token auth, error toasts, 401 redirect callback |
| `entry/src/main/ets/common/model/DeviceModels.ets` | Data interfaces: `RoomState`, `Hardware`, `AirConditioner`, `Light`, `LightMode`, `Curtain`, `Service`, `StateFlags` |
| `entry/src/main/ets/common/mock/` | `MockLogin.ets`, `MockRoomState.ets`, `MockLight.ets`, `MockAircon.ets` |
| `entry/src/main/ets/common/utils/PreferencesUtil.ets` | Token and login info persistence via `@ohos.data.preferences` |
| `entry/src/main/ets/common/utils/DebounceUtil.ets` | Debounce helper |
| `entry/src/main/ets/common/utils/BreakpointUtil.ets` | Breakpoint calculation |
| `entry/src/main/ets/common/components/TabBar.ets` | `TabItemConfig` interface + `TAB_CONFIGS` array |
| `entry/src/main/module.json5` | Module manifest: deviceTypes `["phone", "tablet", "2in1"]`, `ohos.permission.INTERNET` |
| `entry/src/main/resources/base/profile/main_pages.json` | Page routes: `feature/login/LoginPage`, `feature/main/MainPage` |
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

**For development, use mock data only** (coursework requirement). Mock responses live in `common/mock/`.

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

Centralized in `common/api/ApiService.ets`:
- HTTP 401 → clear token + call `onUnauthorized` callback + Toast "登录已过期，请重新登录"
- HTTP 403 → Toast "权限不足，请联系前台"
- HTTP 404 → Toast "服务暂不可用"
- HTTP 500 → Toast "服务器繁忙，请稍后再试"
- Business `code !== 0` → Toast `msg`
- Network error/timeout → Toast "网络连接失败"

## Resources

- Strings in `resources/base/element/string.json` (reference via `$r('app.string.xxx')`)
- Colors in `resources/base/element/color.json` (reference via `$r('app.color.xxx')`)
- Dimensions in `resources/base/element/float.json` (reference via `$r('app.float.xxx')`)
- Media in `resources/base/media/` (reference via `$r('app.media.xxx')`)
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
