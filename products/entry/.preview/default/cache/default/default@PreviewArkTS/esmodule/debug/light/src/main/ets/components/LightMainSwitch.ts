if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
export class LightMainSwitch extends ViewV2 {
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
            Column.create();
            Column.debugLine("features/light/src/main/ets/components/LightMainSwitch.ets(7:5)", "@ohos/light");
            Column.width('100%');
            Column.alignItems(HorizontalAlign.Center);
            Column.onClick(() => {
                this.onToggle();
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331760, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/light/src/main/ets/components/LightMainSwitch.ets(8:7)", "@ohos/light");
            Image.width(120);
            Image.height(120);
            Image.objectFit(ImageFit.Contain);
            Image.fillColor(this.isOn ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331748, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/light/src/main/ets/components/LightMainSwitch.ets(14:7)", "@ohos/light");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 8 });
        }, Text);
        Text.pop();
        Column.pop();
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
