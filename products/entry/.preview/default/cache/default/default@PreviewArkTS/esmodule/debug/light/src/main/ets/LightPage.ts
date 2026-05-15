if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import { LightViewModel } from "@normalized:N&&&@ohos/light/src/main/ets/LightViewModel&1.0.0";
import { LightMainSwitch } from "@normalized:N&&&@ohos/light/src/main/ets/components/LightMainSwitch&1.0.0";
import { LightSceneMode } from "@normalized:N&&&@ohos/light/src/main/ets/components/LightSceneMode&1.0.0";
import { IndependentLight } from "@normalized:N&&&@ohos/light/src/main/ets/components/IndependentLight&1.0.0";
export class LightPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.viewModel = new LightViewModel();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.viewModel = new LightViewModel();
    }
    @Local
    viewModel: LightViewModel;
    async aboutToAppear(): Promise<void> {
        await this.viewModel.loadLights();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/light/src/main/ets/LightPage.ets(15:5)", "@ohos/light");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331756, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/light/src/main/ets/LightPage.ets(16:7)", "@ohos/light");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Scroll.create();
            Scroll.debugLine("features/light/src/main/ets/LightPage.ets(21:7)", "@ohos/light");
            Scroll.width('100%');
            Scroll.height('100%');
            Scroll.scrollBar(BarState.Off);
            Scroll.edgeEffect(EdgeEffect.Spring);
        }, Scroll);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/light/src/main/ets/LightPage.ets(22:9)", "@ohos/light");
            Column.width('100%');
            Column.padding({ left: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, bottom: 24, top: 24 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331750, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/light/src/main/ets/LightPage.ets(23:11)", "@ohos/light");
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
                    let componentCall = new LightMainSwitch(this, {
                        isOn: this.viewModel.mainSwitchOn,
                        onToggle: (): void => {
                            this.viewModel.setAllLights(!this.viewModel.mainSwitchOn);
                        }
                    }, undefined, elmtId, () => { }, { page: "features/light/src/main/ets/LightPage.ets", line: 31, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            isOn: this.viewModel.mainSwitchOn,
                            onToggle: (): void => {
                                this.viewModel.setAllLights(!this.viewModel.mainSwitchOn);
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        isOn: this.viewModel.mainSwitchOn
                    });
                }
            }, { name: "LightMainSwitch" });
        }
        __Common__.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            __Common__.create();
            __Common__.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, __Common__);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new LightSceneMode(this, {
                        currentMode: this.viewModel.currentSceneMode,
                        modes: this.viewModel.lightModes,
                        onModeSelect: (hardwareId: number, modeName: string): void => {
                            this.viewModel.setSceneMode(hardwareId, modeName);
                        }
                    }, undefined, elmtId, () => { }, { page: "features/light/src/main/ets/LightPage.ets", line: 39, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            currentMode: this.viewModel.currentSceneMode,
                            modes: this.viewModel.lightModes,
                            onModeSelect: (hardwareId: number, modeName: string): void => {
                                this.viewModel.setSceneMode(hardwareId, modeName);
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        currentMode: this.viewModel.currentSceneMode,
                        modes: this.viewModel.lightModes
                    });
                }
            }, { name: "LightSceneMode" });
        }
        __Common__.pop();
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new IndependentLight(this, {
                        lights: this.viewModel.lights,
                        onToggle: (index: number): void => {
                            this.viewModel.toggleLight(index);
                        }
                    }, undefined, elmtId, () => { }, { page: "features/light/src/main/ets/LightPage.ets", line: 48, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            lights: this.viewModel.lights,
                            onToggle: (index: number): void => {
                                this.viewModel.toggleLight(index);
                            }
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        lights: this.viewModel.lights
                    });
                }
            }, { name: "IndependentLight" });
        }
        Column.pop();
        Scroll.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
