if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import { HomePage } from "@normalized:N&&&@ohos/home/src/main/ets/Index&1.0.0";
import { LightPage } from "@normalized:N&&&@ohos/light/src/main/ets/Index&1.0.0";
import { CurtainPage } from "@normalized:N&&&@ohos/curtain/src/main/ets/Index&1.0.0";
import { ServicePage } from "@normalized:N&&&@ohos/service/src/main/ets/Index&1.0.0";
import { TAB_CONFIGS } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import type { TabItemConfig } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
export class TabletMainLayout extends ViewV2 {
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
    navItem(config: TabItemConfig, index: number, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/tablet/MainLayout.ets(13:5)", "entry");
            Column.width('100%');
            Column.height(80);
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
            Column.onClick(() => {
                this.currentTab = index;
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.currentTab === index ? config.selectedIcon : config.unselectedIcon);
            Image.debugLine("products/entry/src/main/ets/product/tablet/MainLayout.ets(14:7)", "entry");
            Image.width(32);
            Image.height(32);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(config.label);
            Text.debugLine("products/entry/src/main/ets/product/tablet/MainLayout.ets(18:7)", "entry");
            Text.fontSize(14);
            Text.fontColor(this.currentTab === index ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 4 });
        }, Text);
        Text.pop();
        Column.pop();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("products/entry/src/main/ets/product/tablet/MainLayout.ets(33:5)", "entry");
            Row.width('100%');
            Row.height('100%');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("products/entry/src/main/ets/product/tablet/MainLayout.ets(34:7)", "entry");
            Column.width(120);
            Column.height('100%');
            Column.backgroundColor({ "id": 50331683, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Column.padding({ top: 24, bottom: 24 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, index: number) => {
                const config = _item;
                this.navItem.bind(this)(config, index);
            };
            this.forEachUpdateFunction(elmtId, TAB_CONFIGS, forEachItemGenFunction, (config: TabItemConfig) => config.label, true, false);
        }, ForEach);
        ForEach.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/product/tablet/MainLayout.ets(48:7)", "entry");
            Stack.layoutWeight(1);
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentTab === 0) {
                this.ifElseBranchUpdateFunction(0, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new HomePage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/tablet/MainLayout.ets", line: 50, col: 11 });
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
            }
            else if (this.currentTab === 1) {
                this.ifElseBranchUpdateFunction(1, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new LightPage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/tablet/MainLayout.ets", line: 52, col: 11 });
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
            }
            else if (this.currentTab === 2) {
                this.ifElseBranchUpdateFunction(2, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new CurtainPage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/tablet/MainLayout.ets", line: 54, col: 11 });
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
            }
            else if (this.currentTab === 3) {
                this.ifElseBranchUpdateFunction(3, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new ServicePage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/product/tablet/MainLayout.ets", line: 56, col: 11 });
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
            }
            else {
                this.ifElseBranchUpdateFunction(4, () => {
                });
            }
        }, If);
        If.pop();
        Stack.pop();
        Row.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
