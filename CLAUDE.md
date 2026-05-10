# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Current Project State

The project is at the **DevEco Studio scaffold stage**. Only the default generated files exist. No application code has been written yet.

**What exists:**
- `entry/src/main/ets/pages/Index.ets` — default "Hello World" page
- `entry/src/main/ets/entryability/EntryAbility.ets` — loads `'pages/Index'`, no login routing
- `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets` — default backup extension (empty handlers)
- `entry/src/mock/mock-config.json5` — empty `{}`
- `entry/src/test/` — one scaffold dummy test
- `entry/src/ohosTest/` — one scaffold dummy test
- `entry/src/main/resources/base/media/` — 85 pre-placed images for all features
- Minimal resources: 3 strings, 1 color, 1 float (all DevEco Studio defaults)
- `module.json5`: deviceTypes is `["phone"]` only, no permissions declared
- `main_pages.json`: registers only `["pages/Index"]`

**What needs to be built:**
- Full MVVM architecture with three-layer structure (see Planned Architecture below)
- Login, Home, Light, Curtain, Service feature modules
- Mock data layer (coursework requires mock only, no live API calls)
- Phone, tablet, and foldable layouts
- All resource strings, colors, and dimensions

## Project Overview

HarmonyOS smart hotel room control app (智慧客房) — hotel guests control room devices (lights, AC, curtains) and request services (cleaning, do-not-disturb, SOS) from a phone/tablet/foldable. This is a coursework project built with Claude Code.

**Tech stack:** ArkTS + ArkUI on HarmonyOS SDK 6.0.2 (API 22), Stage mode, Hvigor build system.
**Target devices:** phone, tablet, 2in1 (required by coursework; current scaffold has only `["phone"]` — expand during implementation).

## Build & Test Commands

Build and test happen inside DevEco Studio (HarmonyOS IDE). There is no CLI build.

- **Build:** Open `HonySystem/` in DevEco Studio → Build → Build HAP(s)
- **Run on emulator/device:** Run → Run 'entry'
- **Run unit tests:** Right-click `entry/src/test/` → Run 'LocalUnit.test.ets'
- **Run instrumented tests:** Right-click `entry/src/ohosTest/` → Run
- **Lint:** DevEco Studio auto-lints `.ets` files using rules in `code-linter.json5`

### Test Framework

Hypium (`@ohos/hypium` 1.0.25) with Hamock (`@ohos/hamock` 1.0.0) for mocking. Tests use `describe`/`it`/`expect` API:

```typescript
import { describe, it, expect } from '@ohos/hypium';
export default function mySuite() {
  describe('MySuite', () => {
    it('should work', () => {
      expect(1).assertEqual(1);
    });
  });
}
```

Register test suites in `List.test.ets` (local) and `ohosTest/ets/test/List.test.ets` (instrumented).

## Current File Layout

### Files that exist (DevEco Studio scaffold)

| Path | Role |
|------|------|
| `entry/src/main/ets/entryability/EntryAbility.ets` | App entry (currently loads `pages/Index`) |
| `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets` | Backup extension (default scaffold) |
| `entry/src/main/ets/pages/Index.ets` | Default Hello World page |
| `entry/src/main/module.json5` | Module manifest: deviceTypes `["phone"]`, no permissions |
| `entry/src/main/resources/base/profile/main_pages.json` | Page routes: `["pages/Index"]` only |
| `entry/src/main/resources/base/media/` | 85 image assets (all feature icons, backgrounds, tabs) |
| `entry/src/main/resources/base/element/string.json` | 3 strings (module_desc, EntryAbility_desc, EntryAbility_label) |
| `entry/src/main/resources/base/element/color.json` | 1 color (start_window_background: #FFFFFF) |
| `entry/src/main/resources/base/element/float.json` | 1 float (page_text_font_size: 50fp) |
| `entry/src/mock/mock-config.json5` | Empty — reserved for Hamock framework |
| `entry/src/test/` | LocalUnit.test.ets (scaffold dummy), List.test.ets |
| `entry/src/ohosTest/` | Ability.test.ets (scaffold dummy), List.test.ets |
| `AppScope/app.json5` | App identity: bundleName `com.example.honysystem`, version 1.0.0 |
| `oh-package.json5` | Dev deps: `@ohos/hypium` 1.0.25, `@ohos/hamock` 1.0.0 |
| `build-profile.json5` | SDK 6.0.2(22), HarmonyOS runtime, debug + release modes |
| `code-linter.json5` | ETS/TS + @performance/recommended + security rules |
| `.gitignore` | Ignores node_modules, oh_modules, build, .hvigor, .idea, .test |

### Files to be created (per planned architecture)

| Path | Role |
|------|------|
| `entry/src/main/ets/common/api/ApiService.ets` | Centralized HTTP + error handling |
| `entry/src/main/ets/common/models/DeviceModels.ets` | Data models (lights, AC, curtains, services) |
| `entry/src/main/ets/common/mock/` | MockLogin.ets, MockRoomState.ets, MockLight.ets, MockAircon.ets |
| `entry/src/main/ets/common/utils/` | PreferencesUtil.ets, DebounceUtil.ets |
| `entry/src/main/ets/common/components/` | Shared UI: TabBar.ets, CommonHeader.ets |
| `entry/src/main/ets/feature/login/LoginPage.ets` | Login page + LoginViewModel.ets |
| `entry/src/main/ets/feature/main/MainPage.ets` | Main shell with 4 tabs (Home/Light/Curtain/Service) |
| `entry/src/main/ets/feature/home/` | Home tab: HomePage.ets + HomeViewModel.ets + components |
| `entry/src/main/ets/feature/light/` | Light tab: LightPage.ets + LightViewModel.ets + components |
| `entry/src/main/ets/feature/curtain/` | Curtain tab: CurtainPage.ets + CurtainViewModel.ets + components |
| `entry/src/main/ets/feature/service/` | Service tab: ServicePage.ets + ServiceViewModel.ets + components |
| `entry/src/main/ets/product/phone/MainLayout.ets` | Phone-specific layout |
| `entry/src/main/ets/product/tablet/MainLayout.ets` | Tablet-specific layout |
| `entry/src/main/ets/product/foldable/MainLayout.ets` | Foldable-specific layout |

After implementation, update `EntryAbility.ets` to load `feature/login/LoginPage`, update `main_pages.json` to register LoginPage + MainPage, add `ohos.permission.INTERNET` to `module.json5`, and expand `deviceTypes` to `["phone", "tablet", "2in1"]`.

## Planned Architecture

The architecture below is the target design. None of these modules exist yet. See Current File Layout above for what is actually on disk.

**Pattern:** MVVM (Model-View-ViewModel) with V2 state management decorators.

**Navigation:** HarmonyOS `Navigation` + `NavPathStack`. Entry point will be `feature/login/LoginPage`; after login push `feature/main/MainPage`, which hosts a `Tabs` component with 4 tabs: Home / Light / Curtain / Service.

**Three-layer structure:**
- `common/` — ApiService, data models, mock data, utils (PreferencesUtil, DebounceUtil), shared components (TabBar, CommonHeader)
- `feature/` — feature modules: `login/`, `home/`, `main/`, `light/`, `curtain/`, `service/`. Each has its own Page + ViewModel + components.
- `product/` — device-specific layout assembly: `phone/MainLayout.ets`, `tablet/MainLayout.ets`, `foldable/MainLayout.ets`

**State flow:** `EntryAbility` → `LoginPage` → (token check) → `MainPage (Tabs)` → tab pages consume `RoomState` via `@Provide/@Consume`. Temperature changes use `@Watch` + 500ms debounce.

Reference: full data models, page blueprint tables, and test plans in `E:\HarmonyHotel\资料\项目设计书\项目设计书.md`.

## API Backend

Reference information from the project API docs — used for mock data design during implementation.

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

**For development, use mock data only** (coursework requirement). Mock responses will live in `common/mock/` (MockLogin.ets, MockRoomState.ets, MockLight.ets, MockAircon.ets).

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

## State Management (V2 Decorators)

Use ArkUI V2 state management decorators for MVVM:

- `@State` — component-local reactive state
- `@Prop` — parent-to-child one-way sync
- `@Link` — parent-to-child two-way binding
- `@Provide` / `@Consume` — ancestor-to-descendant state sharing
- `@Observed` / `@ObjectLink` — observable class instances with nested reactivity
- `@Watch` — state change callback (used for temperature debounce)

## Resources

- Strings in `resources/base/element/string.json` (reference via `$r('app.string.xxx')`)
- Colors in `resources/base/element/color.json` (reference via `$r('app.color.xxx')`)
- Dimensions in `resources/base/element/float.json` (reference via `$r('app.float.xxx')`)
- Media in `resources/base/media/` (reference via `$r('app.media.xxx')`)
- Layout dimensions use `fp` (font-relative pixels) and `vp` (virtual pixels)

## Error Handling (Planned)

Centralized in `common/api/ApiService.ets` when implemented:
- HTTP 401 → clear token + redirect to LoginPage
- HTTP 403 → Toast "权限不足，请联系前台"
- HTTP 404 → Toast "服务暂不可用"
- HTTP 500 → Toast "服务器繁忙，请稍后再试"
- Business `code !== 0` → Toast `msg`
- Network timeout (10s) → Toast `$r('app.string.common_network_error')`

## Git

Project is managed with git (`HonySystem/.gitignore`). The `.hvigor/`, `oh_modules/`, `build/`, `.idea/`, and `local.properties` directories are gitignored. Do not commit these.

Commit convention: `type(scope): subject` (feat/fix/test/refactor/docs/style/chore). Each module commit should include its deliverable and test reports under `E:\HarmonyHotel\reports\`.

## Coursework Constraints

From `E:\HarmonyHotel\资料\课内实训.md`:
- Must use MVVM + V2 state management + Navigation + three-layer architecture
- Mock data only during development (no live API calls required)
- Must support phone, tablet, and foldable layouts
- Keep git history clean — commit logical units
- Export chat history alongside code for submission
