if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import type { LightMode } from '@ohos/common';
interface SceneItem {
    label: ResourceStr;
    key: string;
    icon: Resource;
    hardwareId: number;
}
export class LightSceneMode extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("currentMode", (params && "currentMode" in params) ? params.currentMode : '');
        this.initParam("modes", (params && "modes" in params) ? params.modes : []);
        this.onModeSelect = "onModeSelect" in params ? params.onModeSelect : (_id: number, _name: string) => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("currentMode", (params && "currentMode" in params) ? params.currentMode : '');
        this.resetParam("modes", (params && "modes" in params) ? params.modes : []);
        this.onModeSelect = "onModeSelect" in params ? params.onModeSelect : (_id: number, _name: string) => { };
    }
    @Param
    readonly currentMode: string;
    @Param
    readonly modes: LightMode[];
    @Event
    onModeSelect: (hardwareId: number, modeName: string) => void;
    private getSceneItems(): SceneItem[] {
        const iconMap: Record<string, Resource> = {
            '明亮模式': { "id": 50331759, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '柔和模式': { "id": 50331757, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '阅读模式': { "id": 50331752, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '温馨模式': { "id": 50331741, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '睡眠模式': { "id": 50331746, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }
        };
        return this.modes.map((m: LightMode): SceneItem => {
            return {
                label: m.name,
                key: m.name,
                icon: iconMap[m.name] || { "id": 50331759, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
                hardwareId: m.id
            };
        });
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(35:5)", "@ohos/light");
            Column.width('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331749, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(36:7)", "@ohos/light");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Medium);
            Text.width('100%');
            Text.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(43:7)", "@ohos/light");
            Stack.width('100%');
            Stack.height(220);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331754, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(44:9)", "@ohos/light");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Grid.create();
            Grid.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(50:9)", "@ohos/light");
            Grid.columnsTemplate('1fr 1fr');
            Grid.rowsTemplate('1fr 1fr 1fr');
            Grid.rowsGap({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Grid.columnsGap({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Grid.width('100%');
            Grid.height(220);
            Grid.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Grid);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, index: number) => {
                const item = _item;
                {
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        GridItem.create(() => { }, false);
                        GridItem.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(52:13)", "@ohos/light");
                    };
                    const observedDeepRender = () => {
                        this.observeComponentCreation2(itemCreation2, GridItem);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Stack.create();
                            Stack.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(53:15)", "@ohos/light");
                            Stack.width('100%');
                            Stack.height('100%');
                            Stack.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Stack.clip(true);
                            Stack.onClick(() => {
                                this.onModeSelect(item.hardwareId, item.key);
                            });
                        }, Stack);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create({ "id": 50331742, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Image.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(54:17)", "@ohos/light");
                            Image.width('100%');
                            Image.height('100%');
                            Image.objectFit(ImageFit.Fill);
                            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create();
                            Row.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(60:17)", "@ohos/light");
                            Row.width('100%');
                            Row.height('100%');
                            Row.justifyContent(FlexAlign.Center);
                            Row.alignItems(VerticalAlign.Center);
                            Row.backgroundColor(this.currentMode === item.key ? 'rgba(212, 177, 106, 0.35)' : Color.Transparent);
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(item.icon);
                            Image.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(61:19)", "@ohos/light");
                            Image.width(24);
                            Image.height(24);
                            Image.fillColor(this.currentMode === item.key ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(item.label);
                            Text.debugLine("features/light/src/main/ets/components/LightSceneMode.ets(65:19)", "@ohos/light");
                            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Text.fontColor(this.currentMode === item.key ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Text.margin({ left: 8 });
                        }, Text);
                        Text.pop();
                        Row.pop();
                        Stack.pop();
                        GridItem.pop();
                    };
                    observedDeepRender();
                }
            };
            this.forEachUpdateFunction(elmtId, this.getSceneItems(), forEachItemGenFunction, undefined, true, false);
        }, ForEach);
        ForEach.pop();
        Grid.pop();
        Stack.pop();
        Column.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("currentMode" in params) {
            this.updateParam("currentMode", params.currentMode);
        }
        if ("modes" in params) {
            this.updateParam("modes", params.modes);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
