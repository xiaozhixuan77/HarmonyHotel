if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import type common from "@ohos:app.ability.common";
import router from "@ohos:router";
import promptAction from "@ohos:promptAction";
import { ServiceViewModel } from "@normalized:N&&&@ohos/service/src/main/ets/ServiceViewModel&1.0.0";
import { DNDToggle } from "@normalized:N&&&@ohos/service/src/main/ets/components/DNDToggle&1.0.0";
import { CleanRoom } from "@normalized:N&&&@ohos/service/src/main/ets/components/CleanRoom&1.0.0";
import { SOSButton } from "@normalized:N&&&@ohos/service/src/main/ets/components/SOSButton&1.0.0";
export class ServicePage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.viewModel = new ServiceViewModel();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.viewModel = new ServiceViewModel();
    }
    @Local
    viewModel: ServiceViewModel;
    async aboutToAppear(): Promise<void> {
        await this.viewModel.loadServices();
    }
    private showLogoutConfirm(): void {
        promptAction.showDialog({
            title: { "id": 50331796, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            message: '确定要退出登录吗？',
            buttons: [
                { text: { "id": 50331793, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, color: '#666666' },
                { text: { "id": 50331794, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, color: '#4A90D9' }
            ]
        }).then(async (data) => {
            if (data.index === 1) {
                const context: common.Context = getContext(this) as common.Context;
                await this.viewModel.logout(context);
                router.replaceUrl({ url: 'login/LoginPage' });
            }
        }).catch(() => { });
    }
    private showSOSConfirm(): void {
        promptAction.showDialog({
            title: { "id": 50331797, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            message: '确定要发送 SOS 紧急求救信号吗？',
            buttons: [
                { text: { "id": 50331793, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, color: '#666666' },
                { text: { "id": 50331794, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, color: '#E53935' }
            ]
        }).then((data) => {
            if (data.index === 1) {
                this.viewModel.triggerSOS();
                promptAction.showToast({
                    message: 'SOS 信号已发送',
                    duration: 2000
                });
            }
        }).catch(() => { });
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/service/src/main/ets/ServicePage.ets(53:5)", "@ohos/service");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331791, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/ServicePage.ets(54:7)", "@ohos/service");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Scroll.create();
            Scroll.debugLine("features/service/src/main/ets/ServicePage.ets(59:7)", "@ohos/service");
            Scroll.width('100%');
            Scroll.height('100%');
            Scroll.scrollBar(BarState.Off);
            Scroll.edgeEffect(EdgeEffect.Spring);
        }, Scroll);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/service/src/main/ets/ServicePage.ets(60:9)", "@ohos/service");
            Column.width('100%');
            Column.height('90%');
            Column.padding({ left: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, bottom: 24 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331795, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/service/src/main/ets/ServicePage.ets(61:11)", "@ohos/service");
            Text.fontSize({ "id": 50331682, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.textAlign(TextAlign.Center);
            Text.margin({ top: 24 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/service/src/main/ets/ServicePage.ets(69:11)", "@ohos/service");
            Column.layoutWeight(1);
            Column.justifyContent(FlexAlign.Center);
            Column.width('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/service/src/main/ets/ServicePage.ets(70:13)", "@ohos/service");
            Row.width('100%');
            Row.margin({ bottom: 30 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.layoutWeight(1);
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new DNDToggle(this, {
                        isOn: this.viewModel.dndOn,
                        onToggle: (): void => {
                            this.viewModel.toggleDND();
                        }
                    }, undefined, elmtId, () => { }, { page: "features/service/src/main/ets/ServicePage.ets", line: 71, col: 15 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            isOn: this.viewModel.dndOn,
                            onToggle: (): void => {
                                this.viewModel.toggleDND();
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        isOn: this.viewModel.dndOn
                    });
                }
            }, { name: "DNDToggle" });
        }
        __Common__.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.layoutWeight(1);
            __Common__.margin({ left: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new CleanRoom(this, {
                        isOn: this.viewModel.cleanRequested,
                        onToggle: (): void => {
                            if (this.viewModel.cleanRequested) {
                                this.viewModel.cancelClean();
                                promptAction.showToast({
                                    message: '已取消客房服务',
                                    duration: 2000
                                });
                            }
                            else {
                                this.viewModel.requestClean();
                                promptAction.showToast({
                                    message: '已通知客房服务',
                                    duration: 2000
                                });
                            }
                        }
                    }, undefined, elmtId, () => { }, { page: "features/service/src/main/ets/ServicePage.ets", line: 79, col: 15 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            isOn: this.viewModel.cleanRequested,
                            onToggle: (): void => {
                                if (this.viewModel.cleanRequested) {
                                    this.viewModel.cancelClean();
                                    promptAction.showToast({
                                        message: '已取消客房服务',
                                        duration: 2000
                                    });
                                }
                                else {
                                    this.viewModel.requestClean();
                                    promptAction.showToast({
                                        message: '已通知客房服务',
                                        duration: 2000
                                    });
                                }
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        isOn: this.viewModel.cleanRequested
                    });
                }
            }, { name: "CleanRoom" });
        }
        __Common__.pop();
        Row.pop();
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new SOSButton(this, {
                        onConfirm: (): void => {
                            this.showSOSConfirm();
                        }
                    }, undefined, elmtId, () => { }, { page: "features/service/src/main/ets/ServicePage.ets", line: 103, col: 13 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            onConfirm: (): void => {
                                this.showSOSConfirm();
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {});
                }
            }, { name: "SOSButton" });
        }
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331801, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/ServicePage.ets(113:11)", "@ohos/service");
            Image.width('100%');
            Image.height(85);
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331674, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.onClick(() => {
                this.showLogoutConfirm();
            });
        }, Image);
        Column.pop();
        Scroll.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
