if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
export class CurtainAllControl extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.onOpenAll = "onOpenAll" in params ? params.onOpenAll : () => { };
        this.onCloseAll = "onCloseAll" in params ? params.onCloseAll : () => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.onOpenAll = "onOpenAll" in params ? params.onOpenAll : () => { };
        this.onCloseAll = "onCloseAll" in params ? params.onCloseAll : () => { };
    }
    @Event
    onOpenAll: () => void;
    @Event
    onCloseAll: () => void;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(7:5)", "@ohos/curtain");
            Stack.width('100%');
            Stack.height(80);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331766, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(8:7)", "@ohos/curtain");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(14:7)", "@ohos/curtain");
            Row.width('100%');
            Row.height('100%');
            Row.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.justifyContent(FlexAlign.SpaceBetween);
            Row.alignItems(VerticalAlign.Center);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(15:9)", "@ohos/curtain");
            Row.width('48%');
            Row.height('100%');
            Row.justifyContent(FlexAlign.Center);
            Row.alignItems(VerticalAlign.Center);
            Row.backgroundImage({ "id": 50331767, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.backgroundImageSize(ImageSize.Contain);
            Row.backgroundImagePosition(Alignment.Center);
            Row.borderRadius({ "id": 50331674, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.onClick(() => {
                this.onOpenAll();
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331784, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(16:11)", "@ohos/curtain");
            Image.width(24);
            Image.height(24);
            Image.objectFit(ImageFit.Contain);
            Image.margin({ right: 8 });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331773, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(22:11)", "@ohos/curtain");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 8 });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
            Blank.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(39:9)", "@ohos/curtain");
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(41:9)", "@ohos/curtain");
            Row.width('48%');
            Row.height('100%');
            Row.justifyContent(FlexAlign.Center);
            Row.alignItems(VerticalAlign.Center);
            Row.backgroundImage({ "id": 50331767, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.backgroundImageSize(ImageSize.Contain);
            Row.backgroundImagePosition(Alignment.Center);
            Row.borderRadius({ "id": 50331674, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.onClick(() => {
                this.onCloseAll();
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331762, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(42:11)", "@ohos/curtain");
            Image.width(24);
            Image.height(24);
            Image.objectFit(ImageFit.Contain);
            Image.margin({ right: 8 });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331772, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/curtain/src/main/ets/components/CurtainAllControl.ets(48:11)", "@ohos/curtain");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 8 });
        }, Text);
        Text.pop();
        Row.pop();
        Row.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
