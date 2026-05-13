# HonySystem — 智慧客房 App

基于 HarmonyOS SDK 6.0.2 (API 22) 开发的酒店客房控制应用，支持手机、平板、折叠屏三端适配。

## 功能特性

| 模块 | 功能 |
|------|------|
| **登录** | 客房号 + 用户名登录，记住我，自动登录 |
| **首页** | 空调温控（16-30°C）、场景模式快捷切换、晚安模式、服务状态显示 |
| **灯光** | 总开关（全开/全关）、5种场景模式、9路独立灯光控制 |
| **窗帘** | 全开/全关、窗帘1独立控制（开/停/关/半开）、窗纱独立控制 |
| **服务** | 请勿打扰开关、清理房间请求、SOS紧急求救、退出登录 |
| **多设备** | 响应式断点布局：手机底部Tab、平板左侧导航、折叠屏宽屏适配 |

## 技术架构

**MVVM + V2 状态管理**
- View：`@ComponentV2` + `@Local` / `@Param` / `@Event`
- ViewModel：`@ObservedV2` + `@Trace`
- Model：数据实体 + Mock API Service

**三层工程目录**
```
entry/src/main/ets/
├── common/          # 公共层：API、模型、Mock、工具、组件配置
├── feature/         # 功能层：login / main / home / light / curtain / service
├── product/         # 设备适配层：phone / tablet / foldable
└── entryability/    # 入口 Ability
```

## 项目目录结构

```
entry/src/main/ets/
├── common/
│   ├── api/ApiService.ets              # HTTP 请求封装
│   ├── components/TabBar.ets           # Tab 导航配置
│   ├── mock/
│   │   ├── MockLogin.ets               # 登录 Mock
│   │   ├── MockRoomState.ets           # 客房状态 Mock
│   │   ├── MockLight.ets               # 灯光控制 Mock
│   │   └── MockAircon.ets              # 空调控制 Mock
│   ├── model/
│   │   ├── ApiResponse.ets             # 通用响应结构
│   │   └── DeviceModels.ets            # 设备实体定义
│   └── utils/
│       ├── BreakpointUtil.ets          # 断点计算工具
│       ├── DebounceUtil.ets            # 防抖工具
│       └── PreferencesUtil.ets         # 本地存储（token）
├── feature/
│   ├── login/
│   │   ├── LoginPage.ets               # 登录页
│   │   └── LoginViewModel.ets          # 登录逻辑
│   ├── main/
│   │   └── MainPage.ets                # 主页断点分发入口
│   ├── home/
│   │   ├── HomePage.ets                # 首页
│   │   ├── HomeViewModel.ets           # 首页逻辑
│   │   └── components/                 # 空调控制、场景模式、服务状态
│   ├── light/
│   │   ├── LightPage.ets               # 灯光页
│   │   ├── LightViewModel.ets          # 灯光逻辑
│   │   └── components/                 # 总开关、场景模式、独立灯光
│   ├── curtain/
│   │   ├── CurtainPage.ets             # 窗帘页
│   │   ├── CurtainViewModel.ets        # 窗帘逻辑
│   │   └── components/                 # 全开全关、窗帘、窗纱
│   └── service/
│       ├── ServicePage.ets             # 服务页
│       ├── ServiceViewModel.ets        # 服务逻辑
│       └── components/                 # 勿扰开关、清理房间、SOS
└── product/
    ├── phone/MainLayout.ets            # 手机：底部 Tabs
    ├── tablet/MainLayout.ets           # 平板：左侧导航 + 右侧内容
    └── foldable/MainLayout.ets         # 折叠屏：宽导航 + 宽内容区
```

## 编译运行

1. 使用 **DevEco Studio 5.0.3** 或更高版本打开 `HonySystem/` 目录
2. 确保 SDK 为 **HarmonyOS SDK 6.0.2 (API 22)**
3. **Build → Build HAP(s)**，确认零编译错误
4. 在 Previewer 中切换 **phone / tablet / 2in1** 设备验证布局

## 测试

| 测试类型 | 目录 | 说明 |
|----------|------|------|
| 本地单元测试 | `entry/src/test/` | ViewModel 逻辑、工具函数、Mock API |
| 插桩测试 | `entry/src/ohosTest/` | UI 交互、页面渲染、Ability 生命周期 |

运行方式：
- 单元测试：DevEco Studio → 选中测试文件 → 右键 Run
- 插桩测试：连接真机或模拟器 → Run → Instrumented Tests

## 设计资料

- **项目设计书**：`E:\HarmonyHotel\资料\项目设计书\项目设计书.md`
- **接口文档**：`E:\HarmonyHotel\资料\智慧客房接口文档.md`
- **UI 资源**：`entry/src/main/resources/base/media/`（85 张图片）

## Git 提交历史

```
778b9a7 refactor: 代码审核修复硬编码中文与未使用导入
ccfbb17 style: 首页布局与空调组件UI微调
c254e0f chore: 清理残留 .gitkeep 空文件
a1464e2 feat(product): 实现多设备适配（平板/折叠屏布局）
43a61a4 style: 统一页面标题居中与字号调整
8c0e9e6 feat(service): 调整服务模块 UI 布局
...（共 27 个 commit）
4e23b2f chore(config): 搭建三层目录结构，基础配置更新
```

提交规范：`type(scope): subject`，type 包括 feat / fix / style / refactor / test / chore / docs。

## 交付报告

各步骤交付报告位于 `E:\HarmonyHotel\reports\`：

| 步骤 | 模块 | 报告路径 |
|------|------|----------|
| 1 | 公共层 | `reports/01-common-layer/` |
| 2 | 登录模块 | `reports/02-login/` |
| 3 | 导航框架 | `reports/03-navigation/` |
| 4 | 首页模块 | `reports/04-home/` |
| 5 | 灯光模块 | `reports/05-light/` |
| 6 | 窗帘模块 | `reports/06-curtain/` |
| 7 | 服务模块 | `reports/07-service/` |
| 8 | 多设备适配 | `reports/08-multi-device/` |
| 10 | 整体联调与收尾 | `reports/10-final/` |

## 许可证

课程实训项目，仅供学习交流使用。
