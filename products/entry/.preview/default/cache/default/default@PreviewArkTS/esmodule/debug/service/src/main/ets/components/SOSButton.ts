if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
export class SOSButton extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.onConfirm = "onConfirm" in params ? params.onConfirm : () => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.onConfirm = "onConfirm" in params ? params.onConfirm : () => { };
    }
    @Event
    onConfirm: () => void;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/service/src/main/ets/components/SOSButton.ets(6:5)", "@ohos/service");
            Stack.width('100%');
            Stack.height(120);
            Stack.onClick(() => {
                this.onConfirm();
            });
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331804, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/service/src/main/ets/components/SOSButton.ets(7:7)", "@ohos/service");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
