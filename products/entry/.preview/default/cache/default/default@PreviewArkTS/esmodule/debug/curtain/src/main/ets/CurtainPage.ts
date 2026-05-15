if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import { CurtainViewModel } from "@normalized:N&&&@ohos/curtain/src/main/ets/CurtainViewModel&1.0.0";
import { CurtainAllControl } from "@normalized:N&&&@ohos/curtain/src/main/ets/components/CurtainAllControl&1.0.0";
import { CurtainSingle } from "@normalized:N&&&@ohos/curtain/src/main/ets/components/CurtainSingle&1.0.0";
import { WindowScreening } from "@normalized:N&&&@ohos/curtain/src/main/ets/components/WindowScreening&1.0.0";
import type { CurtainState } from '@ohos/common';
export class CurtainPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.viewModel = new CurtainViewModel();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.viewModel = new CurtainViewModel();
    }
    @Local
    viewModel: CurtainViewModel;
    async aboutToAppear(): Promise<void> {
        await this.viewModel.loadCurtains();
    }
    private getCurtainState(index: number): CurtainState {
        if (index < 0 || index >= this.viewModel.curtains.length) {
            return 'close';
        }
        return this.viewModel.curtains[index].state || 'close';
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/curtain/src/main/ets/CurtainPage.ets(23:5)", "@ohos/curtain");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331790, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/CurtainPage.ets(24:7)", "@ohos/curtain");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Scroll.create();
            Scroll.debugLine("features/curtain/src/main/ets/CurtainPage.ets(29:7)", "@ohos/curtain");
            Scroll.width('100%');
            Scroll.height('100%');
            Scroll.scrollBar(BarState.Off);
            Scroll.edgeEffect(EdgeEffect.Spring);
        }, Scroll);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/curtain/src/main/ets/CurtainPage.ets(30:9)", "@ohos/curtain");
            Column.width('100%');
            Column.padding({ left: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, bottom: 24 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331779, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/curtain/src/main/ets/CurtainPage.ets(31:11)", "@ohos/curtain");
            Text.fontSize({ "id": 50331682, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Bold);
            Text.textAlign(TextAlign.Center);
            Text.width('100%');
            Text.margin({ top: 24, bottom: 20 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new CurtainAllControl(this, {
                        onOpenAll: (): void => {
                            this.viewModel.setAll('open');
                        },
                        onCloseAll: (): void => {
                            this.viewModel.setAll('close');
                        }
                    }, undefined, elmtId, () => { }, { page: "features/curtain/src/main/ets/CurtainPage.ets", line: 39, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            onOpenAll: (): void => {
                                this.viewModel.setAll('open');
                            },
                            onCloseAll: (): void => {
                                this.viewModel.setAll('close');
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {});
                }
            }, { name: "CurtainAllControl" });
        }
        __Common__.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new CurtainSingle(this, {
                        state: this.getCurtainState(0),
                        onStateChange: (state: CurtainState): void => {
                            this.viewModel.setCurtainState(0, state);
                        }
                    }, undefined, elmtId, () => { }, { page: "features/curtain/src/main/ets/CurtainPage.ets", line: 49, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            state: this.getCurtainState(0),
                            onStateChange: (state: CurtainState): void => {
                                this.viewModel.setCurtainState(0, state);
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        state: this.getCurtainState(0)
                    });
                }
            }, { name: "CurtainSingle" });
        }
        __Common__.pop();
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new WindowScreening(this, {
                        state: this.getCurtainState(1),
                        onStateChange: (state: CurtainState): void => {
                            this.viewModel.setCurtainState(1, state);
                        }
                    }, undefined, elmtId, () => { }, { page: "features/curtain/src/main/ets/CurtainPage.ets", line: 57, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            state: this.getCurtainState(1),
                            onStateChange: (state: CurtainState): void => {
                                this.viewModel.setCurtainState(1, state);
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        state: this.getCurtainState(1)
                    });
                }
            }, { name: "WindowScreening" });
        }
        Column.pop();
        Scroll.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
