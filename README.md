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

**多模块工程结构**
```
common/            # 公共 HAR：datastore / network / uicomponents / utils
features/          # 功能 HAR：login / home / light / curtain / service
products/default   # 入口 HAP：页面、设备适配布局、入口 Ability
```

## 项目目录结构

```
HonySystem/
├── AppScope/                  # 应用级配置与资源
├── common/                    # 公共 HAR 模块
│   ├── datastore/             # 本地存储（Preferences）、共享状态（RoomServiceState / EventBus）
│   ├── network/               # HTTP 请求封装
│   ├── uicomponents/          # 公共 UI 组件
│   └── utils/                 # 断点计算、防抖等工具
├── features/                  # 功能 HAR 模块（各含 View / ViewModel）
│   ├── login/                 # 登录（记住我、自动登录）
│   ├── home/                  # 首页（空调、场景模式、服务状态）
│   ├── light/                 # 灯光控制（总开关、场景、独立灯光）
│   ├── curtain/               # 窗帘控制（窗帘 1 / 窗纱）
│   └── service/               # 客房服务（勿扰、清理、SOS）
├── products/default/          # 唯一入口 HAP（pages / entryability / 设备布局）
├── 资料/                      # 项目设计书、接口文档、UI 素材、对话记录
└── reports/                   # 各步骤交付报告与测试报告
```

## 编译运行

1. 使用 **DevEco Studio 5.0.3** 或更高版本打开项目根目录
2. 确保 SDK 为 **HarmonyOS SDK 6.0.2 (API 22)**
3. **Build → Build HAP(s)**，确认零编译错误
4. 在 Previewer 中切换 **phone / tablet / 2in1** 设备验证布局

## 测试

自动化测试套件已于 2026-09 移除，功能验证通过 DevEco Studio Previewer（多设备预览）与真机手动完成。

## 设计资料

- **项目设计书**：`资料/项目设计书/项目设计书.md`
- **接口文档**：`资料/智慧客房接口文档.md`
- **UI 素材**：各模块 `src/main/resources/base/media/`，设计稿素材见 `资料/media/`

## Git 提交历史

```
778b9a7 refactor: 代码审核修复硬编码中文与未使用导入
ccfbb17 style: 首页布局与空调组件UI微调
c254e0f chore: 清理残留 .gitkeep 空文件
a1464e2 feat(product): 实现多设备适配（平板/折叠屏布局）
43a61a4 style: 统一页面标题居中与字号调整
8c0e9e6 feat(service): 调整服务模块 UI 布局
...（完整历史见 git log）
4e23b2f chore(config): 搭建三层目录结构，基础配置更新
```

提交规范：`type(scope): subject`，type 包括 feat / fix / style / refactor / test / chore / docs。

## 交付报告

各步骤交付报告位于 `reports/`：

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
