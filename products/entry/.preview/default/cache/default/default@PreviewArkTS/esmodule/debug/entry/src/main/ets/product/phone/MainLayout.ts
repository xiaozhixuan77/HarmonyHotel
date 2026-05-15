if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import { HomePage } from "@normalized:N&&&@ohos/home/src/main/ets/Index&1.0.0";
import { LightPage } from "@normalized:N&&&@ohos/light/src/main/ets/Index&1.0.0";
import { CurtainPage } from "@normalized:N&&&@ohos/curtain/src/main/ets/Index&1.0.0";
import { ServicePage } from "@normalized:N&&&@ohos/service/src/main/ets/Index&1.0.0";
export class PhoneMainLayout extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.currentTab = 0;
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.currentTab = 0;
    }
    @Local
    currentTab: number;
    tabHome(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(12:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentTab === 0) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Image.create({ "id": 50331654, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(14:9)", "entry");
                        Image.width('100%');
                        Image.height('100%');
                        Image.objectFit(ImageFit.Fill);
                    }, Image);
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(19:7)", "entry");
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.currentTab === 0 ? { "id": 50331656, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331661, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(20:9)", "entry");
            Image.width({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331666, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(25:9)", "entry");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(this.currentTab === 0 ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 2 });
        }, Text);
        Text.pop();
        Column.pop();
        Stack.pop();
    }
    tabLight(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(43:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentTab === 1) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Image.create({ "id": 50331654, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(45:9)", "entry");
                        Image.width('100%');
                        Image.height('100%');
                        Image.objectFit(ImageFit.Fill);
                    }, Image);
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(50:7)", "entry");
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.currentTab === 1 ? { "id": 50331660, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331657, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(51:9)", "entry");
            Image.width({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331667, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(56:9)", "entry");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(this.currentTab === 1 ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 2 });
        }, Text);
        Text.pop();
        Column.pop();
        Stack.pop();
    }
    tabCurtain(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(74:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentTab === 2) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Image.create({ "id": 50331654, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(76:9)", "entry");
                        Image.width('100%');
                        Image.height('100%');
                        Image.objectFit(ImageFit.Fill);
                    }, Image);
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(81:7)", "entry");
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.currentTab === 2 ? { "id": 50331655, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331694, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(82:9)", "entry");
            Image.width({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331665, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(87:9)", "entry");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(this.currentTab === 2 ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 2 });
        }, Text);
        Text.pop();
        Column.pop();
        Stack.pop();
    }
    tabService(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(105:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentTab === 3) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Image.create({ "id": 50331654, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(107:9)", "entry");
                        Image.width('100%');
                        Image.height('100%');
                        Image.objectFit(ImageFit.Fill);
                    }, Image);
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(112:7)", "entry");
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.currentTab === 3 ? { "id": 50331652, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331653, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(113:9)", "entry");
            Image.width({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331668, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(118:9)", "entry");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(this.currentTab === 3 ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 2 });
        }, Text);
        Text.pop();
        Column.pop();
        Stack.pop();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create({ alignContent: Alignment.Bottom });
            Stack.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(135:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Tabs.create({
                index: this.currentTab,
                barPosition: BarPosition.End
            });
            Tabs.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(136:7)", "entry");
            Tabs.barHeight(0);
            Tabs.backgroundColor('rgba(0,0,0,0)');
            Tabs.animationDuration(200);
            Tabs.onChange((index: number) => {
                this.currentTab = index;
            });
            Tabs.width('100%');
            Tabs.height('100%');
        }, Tabs);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new HomePage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/phone/MainLayout.ets", line: 141, col: 11 });
                            ViewV2.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "HomePage" });
                }
            });
            TabContent.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(140:9)", "entry");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new LightPage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/phone/MainLayout.ets", line: 145, col: 11 });
                            ViewV2.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "LightPage" });
                }
            });
            TabContent.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(144:9)", "entry");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new CurtainPage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/phone/MainLayout.ets", line: 149, col: 11 });
                            ViewV2.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "CurtainPage" });
                }
            });
            TabContent.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(148:9)", "entry");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new ServicePage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/phone/MainLayout.ets", line: 153, col: 11 });
                            ViewV2.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "ServicePage" });
                }
            });
            TabContent.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(152:9)", "entry");
        }, TabContent);
        TabContent.pop();
        Tabs.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331669, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(165:7)", "entry");
            Image.width('100%');
            Image.height({ "id": 50331679, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.objectFit(ImageFit.Fill);
            Image.align(Alignment.Bottom);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(171:7)", "entry");
            Row.width('100%');
            Row.height({ "id": 50331679, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.align(Alignment.Bottom);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(172:9)", "entry");
            Column.layoutWeight(1);
            Column.height('100%');
            Column.onClick(() => {
                this.currentTab = 0;
            });
        }, Column);
        this.tabHome.bind(this)();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(181:9)", "entry");
            Column.layoutWeight(1);
            Column.height('100%');
            Column.onClick(() => {
                this.currentTab = 1;
            });
        }, Column);
        this.tabLight.bind(this)();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(190:9)", "entry");
            Column.layoutWeight(1);
            Column.height('100%');
            Column.onClick(() => {
                this.currentTab = 2;
            });
        }, Column);
        this.tabCurtain.bind(this)();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/phone/MainLayout.ets(199:9)", "entry");
            Column.layoutWeight(1);
            Column.height('100%');
            Column.onClick(() => {
                this.currentTab = 3;
            });
        }, Column);
        this.tabService.bind(this)();
        Column.pop();
        Row.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
