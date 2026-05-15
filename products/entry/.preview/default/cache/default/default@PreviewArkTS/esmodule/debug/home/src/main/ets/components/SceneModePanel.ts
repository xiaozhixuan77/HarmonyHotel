if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface SceneModeItem {
    label: ResourceStr;
    key: string;
    icon: Resource;
    hardwareId: number;
}
export class SceneModePanel extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("currentMode", (params && "currentMode" in params) ? params.currentMode : '');
        this.onModeSelect = "onModeSelect" in params ? params.onModeSelect : (_id: number, _name: string) => { };
        this.modes = [
            { label: { "id": 50331720, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, key: '明亮', icon: { "id": 50331728, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, hardwareId: 103119 },
            { label: { "id": 50331722, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, key: '柔和', icon: { "id": 50331731, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, hardwareId: 103120 },
            { label: { "id": 50331721, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, key: '阅读', icon: { "id": 50331735, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, hardwareId: 103121 },
            { label: { "id": 50331723, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, key: '温馨', icon: { "id": 50331732, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, hardwareId: 103122 }
        ];
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("currentMode", (params && "currentMode" in params) ? params.currentMode : '');
        this.onModeSelect = "onModeSelect" in params ? params.onModeSelect : (_id: number, _name: string) => { };
    }
    @Param
    readonly currentMode: string;
    @Event
    onModeSelect: (hardwareId: number, modeName: string) => void;
    private modes: SceneModeItem[];
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(21:5)", "@ohos/home");
            Column.width('100%');
            Column.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Column.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331716, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(22:7)", "@ohos/home");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Medium);
            Text.width('100%');
            Text.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Grid.create();
            Grid.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(29:7)", "@ohos/home");
            Grid.columnsTemplate('1fr 1fr');
            Grid.rowsTemplate('1fr 1fr');
            Grid.rowsGap({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Grid.columnsGap({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Grid.width('100%');
            Grid.height(160);
        }, Grid);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, index: number) => {
                const item = _item;
                {
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        GridItem.create(() => { }, false);
                        GridItem.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(31:11)", "@ohos/home");
                    };
                    const observedDeepRender = () => {
                        this.observeComponentCreation2(itemCreation2, GridItem);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Stack.create();
                            Stack.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(32:13)", "@ohos/home");
                            Stack.width('100%');
                            Stack.height('100%');
                            Stack.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Stack.clip(true);
                            Stack.onClick(() => {
                                this.onModeSelect(item.hardwareId, item.key);
                            });
                        }, Stack);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create({ "id": 50331730, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Image.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(33:15)", "@ohos/home");
                            Image.width('100%');
                            Image.height('100%');
                            Image.objectFit(ImageFit.Fill);
                            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create();
                            Row.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(39:15)", "@ohos/home");
                            Row.width('100%');
                            Row.height('100%');
                            Row.justifyContent(FlexAlign.Center);
                            Row.alignItems(VerticalAlign.Center);
                            Row.backgroundColor(this.currentMode === item.key ? 'rgba(212, 177, 106, 0.35)' : Color.Transparent);
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(item.icon);
                            Image.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(40:17)", "@ohos/home");
                            Image.width({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Image.height({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Image.fillColor(this.currentMode === item.key ? '#50C878' : Color.Black);
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(item.label);
                            Text.debugLine("features/home/src/main/ets/components/SceneModePanel.ets(44:17)", "@ohos/home");
                            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                            Text.fontColor(this.currentMode === item.key ? '#50C878' : Color.Black);
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
            this.forEachUpdateFunction(elmtId, this.modes, forEachItemGenFunction, undefined, true, false);
        }, ForEach);
        ForEach.pop();
        Grid.pop();
        Column.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("currentMode" in params) {
            this.updateParam("currentMode", params.currentMode);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
