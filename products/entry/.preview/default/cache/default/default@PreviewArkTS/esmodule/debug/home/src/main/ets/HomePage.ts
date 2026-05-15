if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import { HomeViewModel } from "@normalized:N&&&@ohos/home/src/main/ets/HomeViewModel&1.0.0";
import { AirconControl } from "@normalized:N&&&@ohos/home/src/main/ets/components/AirconControl&1.0.0";
import { SceneModePanel } from "@normalized:N&&&@ohos/home/src/main/ets/components/SceneModePanel&1.0.0";
import { ServiceStatus } from "@normalized:N&&&@ohos/home/src/main/ets/components/ServiceStatus&1.0.0";
import promptAction from "@ohos:promptAction";
export class HomePage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.viewModel = new HomeViewModel();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.viewModel = new HomeViewModel();
    }
    @Local
    viewModel: HomeViewModel;
    async aboutToAppear(): Promise<void> {
        await this.viewModel.loadRoomState();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/home/src/main/ets/HomePage.ets(16:5)", "@ohos/home");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331734, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/HomePage.ets(17:7)", "@ohos/home");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Scroll.create();
            Scroll.debugLine("features/home/src/main/ets/HomePage.ets(22:7)", "@ohos/home");
            Scroll.width('100%');
            Scroll.height('100%');
            Scroll.scrollBar(BarState.Off);
            Scroll.edgeEffect(EdgeEffect.Spring);
        }, Scroll);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/HomePage.ets(23:9)", "@ohos/home");
            Column.width('100%');
            Column.padding({ left: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
            Column.padding({ bottom: 24 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/HomePage.ets(24:11)", "@ohos/home");
            Row.width('100%');
            Row.margin({ top: 24, bottom: 20 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/HomePage.ets(25:13)", "@ohos/home");
            Column.alignItems(HorizontalAlign.Start);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331726, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/HomePage.ets(26:15)", "@ohos/home");
            Image.width(140);
            Image.height(32);
            Image.objectFit(ImageFit.Contain);
            Image.margin({ left: 8 });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/HomePage.ets(31:15)", "@ohos/home");
            Row.margin({ top: 2 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331719, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/HomePage.ets(32:17)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ left: 13 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331715, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/HomePage.ets(36:17)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.viewModel.roomNumber);
            Text.debugLine("features/home/src/main/ets/HomePage.ets(39:17)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Text);
        Text.pop();
        Row.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
            Blank.debugLine("features/home/src/main/ets/HomePage.ets(48:13)", "@ohos/home");
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.viewModel.hotelName.length > 0) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create(this.viewModel.hotelName);
                        Text.debugLine("features/home/src/main/ets/HomePage.ets(51:15)", "@ohos/home");
                        Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Text.alignSelf(ItemAlign.Start);
                    }, Text);
                    Text.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.margin({ bottom: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new AirconControl(this, {
                        settingTemp: this.viewModel.settingTemp,
                        currentTemp: this.viewModel.currentTemp,
                        isOn: this.viewModel.acPower,
                        isLoading: this.viewModel.isLoading,
                        onTempUp: (): void => { this.viewModel.tempUp(); },
                        onTempDown: (): void => { this.viewModel.tempDown(); },
                        onPowerToggle: (): void => { this.viewModel.togglePower(); }
                    }, undefined, elmtId, () => { }, { page: "features/home/src/main/ets/HomePage.ets", line: 60, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            settingTemp: this.viewModel.settingTemp,
                            currentTemp: this.viewModel.currentTemp,
                            isOn: this.viewModel.acPower,
                            isLoading: this.viewModel.isLoading,
                            onTempUp: (): void => { this.viewModel.tempUp(); },
                            onTempDown: (): void => { this.viewModel.tempDown(); },
                            onPowerToggle: (): void => { this.viewModel.togglePower(); }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        settingTemp: this.viewModel.settingTemp,
                        currentTemp: this.viewModel.currentTemp,
                        isOn: this.viewModel.acPower,
                        isLoading: this.viewModel.isLoading
                    });
                }
            }, { name: "AirconControl" });
        }
        __Common__.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.margin({ bottom: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new SceneModePanel(this, {
                        currentMode: this.viewModel.currentSceneMode,
                        onModeSelect: (hardwareId: number, modeName: string): void => {
                            this.viewModel.setSceneMode(hardwareId, modeName);
                        }
                    }, undefined, elmtId, () => { }, { page: "features/home/src/main/ets/HomePage.ets", line: 71, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            currentMode: this.viewModel.currentSceneMode,
                            onModeSelect: (hardwareId: number, modeName: string): void => {
                                this.viewModel.setSceneMode(hardwareId, modeName);
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        currentMode: this.viewModel.currentSceneMode
                    });
                }
            }, { name: "SceneModePanel" });
        }
        __Common__.pop();
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceStatus(this, {
                        dndActive: this.viewModel.dndActive,
                        cleanRequested: this.viewModel.cleanRequested,
                        onDNDToggle: (): void => { this.viewModel.toggleDND(); },
                        onCleanToggle: (): void => {
                            this.viewModel.toggleClean();
                            promptAction.showToast({
                                message: this.viewModel.cleanRequested ? '已通知客房服务' : '已取消客房服务',
                                duration: 2000
                            });
                        },
                        onGoodNight: (): void => { this.viewModel.goodNightMode(); }
                    }, undefined, elmtId, () => { }, { page: "features/home/src/main/ets/HomePage.ets", line: 79, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            dndActive: this.viewModel.dndActive,
                            cleanRequested: this.viewModel.cleanRequested,
                            onDNDToggle: (): void => { this.viewModel.toggleDND(); },
                            onCleanToggle: (): void => {
                                this.viewModel.toggleClean();
                                promptAction.showToast({
                                    message: this.viewModel.cleanRequested ? '已通知客房服务' : '已取消客房服务',
                                    duration: 2000
                                });
                            },
                            onGoodNight: (): void => { this.viewModel.goodNightMode(); }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        dndActive: this.viewModel.dndActive,
                        cleanRequested: this.viewModel.cleanRequested
                    });
                }
            }, { name: "ServiceStatus" });
        }
        Column.pop();
        Scroll.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "HomePage";
    }
}
registerNamedRoute(() => new HomePage(undefined, {}), "", { bundleName: "com.example.honysystem", moduleName: "entry", pagePath: "../../../../../features/home/src/main/ets/HomePage", pageFullPath: "features/home/src/main/ets/HomePage", integratedHsp: "false", moduleType: "followWithHap" });
