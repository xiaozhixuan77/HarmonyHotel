if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
export class DNDToggle extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("isOn", (params && "isOn" in params) ? params.isOn : false);
        this.onToggle = "onToggle" in params ? params.onToggle : () => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("isOn", (params && "isOn" in params) ? params.isOn : false);
        this.onToggle = "onToggle" in params ? params.onToggle : () => { };
    }
    @Param
    readonly isOn: boolean;
    @Event
    onToggle: () => void;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/service/src/main/ets/components/DNDToggle.ets(7:5)", "@ohos/service");
            Stack.width('100%');
            Stack.height(140);
            Stack.onClick(() => {
                this.onToggle();
            });
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331803, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/components/DNDToggle.ets(8:7)", "@ohos/service");
            Image.width('100%');
            Image.height('110%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/service/src/main/ets/components/DNDToggle.ets(14:7)", "@ohos/service");
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331800, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/components/DNDToggle.ets(15:9)", "@ohos/service");
            Image.width(40);
            Image.height(40);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331725, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/service/src/main/ets/components/DNDToggle.ets(19:9)", "@ohos/service");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create({ alignContent: Alignment.Start });
            Stack.debugLine("features/service/src/main/ets/components/DNDToggle.ets(24:9)", "@ohos/service");
            Stack.width(56);
            Stack.height(32);
            Stack.margin({ top: 8 });
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331798, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/components/DNDToggle.ets(25:11)", "@ohos/service");
            Image.width(56);
            Image.height(32);
            Image.objectFit(ImageFit.Fill);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331802, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/components/DNDToggle.ets(30:11)", "@ohos/service");
            Context.animation({
                duration: 200,
                curve: Curve.EaseInOut
            });
            Image.width(28);
            Image.height(28);
            Image.position({
                x: this.isOn ? 26 : 2,
                y: 2
            });
            Context.animation(null);
        }, Image);
        Stack.pop();
        Column.pop();
        Stack.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("isOn" in params) {
            this.updateParam("isOn", params.isOn);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
