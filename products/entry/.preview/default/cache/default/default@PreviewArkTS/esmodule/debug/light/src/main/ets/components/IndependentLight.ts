if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import type { Light } from '@ohos/common';
export class IndependentLight extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("lights", (params && "lights" in params) ? params.lights : []);
        this.onToggle = "onToggle" in params ? params.onToggle : (_index: number) => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("lights", (params && "lights" in params) ? params.lights : []);
        this.onToggle = "onToggle" in params ? params.onToggle : (_index: number) => { };
    }
    @Param
    readonly lights: Light[];
    @Event
    onToggle: (index: number) => void;
    private getLightIcon(name: string): Resource {
        const map: Record<string, Resource> = {
            '廊灯': { "id": 50331743, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '洗漱间': { "id": 50331745, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '衣柜灯': { "id": 50331739, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '落地灯': { "id": 50331755, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '吧灯': { "id": 50331740, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '书桌灯': { "id": 50331755, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '左阅读灯': { "id": 50331755, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '右阅读灯': { "id": 50331755, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
            '排风扇': { "id": 50331751, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }
        };
        return map[name] || { "id": 50331743, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/light/src/main/ets/components/IndependentLight.ets(24:5)", "@ohos/light");
            Column.width('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331747, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/light/src/main/ets/components/IndependentLight.ets(25:7)", "@ohos/light");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Medium);
            Text.width('100%');
            Text.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/light/src/main/ets/components/IndependentLight.ets(32:7)", "@ohos/light");
            Stack.width('100%');
            Stack.height(260);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331761, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/light/src/main/ets/components/IndependentLight.ets(33:9)", "@ohos/light");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Grid.create();
            Grid.debugLine("features/light/src/main/ets/components/IndependentLight.ets(39:9)", "@ohos/light");
            Grid.columnsTemplate('1fr 1fr');
            Grid.rowsTemplate('1fr 1fr 1fr 1fr 1fr');
            Grid.rowsGap(8);
            Grid.columnsGap({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Grid.width('100%');
            Grid.height(260);
            Grid.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Grid);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, index: number) => {
                const light = _item;
                {
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        GridItem.create(() => { }, false);
                        GridItem.debugLine("features/light/src/main/ets/components/IndependentLight.ets(41:13)", "@ohos/light");
                    };
                    const observedDeepRender = () => {
                        this.observeComponentCreation2(itemCreation2, GridItem);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create();
                            Row.debugLine("features/light/src/main/ets/components/IndependentLight.ets(42:15)", "@ohos/light");
                            Row.width('100%');
                            Row.height(44);
                            Row.padding({ left: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
                            Row.justifyContent(FlexAlign.SpaceBetween);
                            Row.alignItems(VerticalAlign.Center);
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create();
                            Row.debugLine("features/light/src/main/ets/components/IndependentLight.ets(43:17)", "@ohos/light");
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(this.getLightIcon(light.name));
                            Image.debugLine("features/light/src/main/ets/components/IndependentLight.ets(44:19)", "@ohos/light");
                            Image.width(20);
                            Image.height(20);
                            Image.fillColor(light.on ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(light.name);
                            Text.debugLine("features/light/src/main/ets/components/IndependentLight.ets(49:19)", "@ohos/light");
                            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Text.fontColor(light.on ? { "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Text.margin({ left: 6 });
                        }, Text);
                        Text.pop();
                        Row.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Blank.create();
                            Blank.debugLine("features/light/src/main/ets/components/IndependentLight.ets(55:17)", "@ohos/light");
                        }, Blank);
                        Blank.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(light.on ? { "id": 50331744, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331758, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Image.debugLine("features/light/src/main/ets/components/IndependentLight.ets(57:19)", "@ohos/light");
                            Image.width(24);
                            Image.height(24);
                            Image.objectFit(ImageFit.Contain);
                            Image.onClick(() => {
                                this.onToggle(index);
                            });
                        }, Image);
                        Row.pop();
                        GridItem.pop();
                    };
                    observedDeepRender();
                }
            };
            this.forEachUpdateFunction(elmtId, this.lights, forEachItemGenFunction, undefined, true, false);
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
        if ("lights" in params) {
            this.updateParam("lights", params.lights);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
