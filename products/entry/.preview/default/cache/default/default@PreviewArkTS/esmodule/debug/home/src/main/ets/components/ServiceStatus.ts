if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
export class ServiceStatus extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("dndActive", (params && "dndActive" in params) ? params.dndActive : false);
        this.initParam("cleanRequested", (params && "cleanRequested" in params) ? params.cleanRequested : false);
        this.onDNDToggle = "onDNDToggle" in params ? params.onDNDToggle : () => { };
        this.onCleanToggle = "onCleanToggle" in params ? params.onCleanToggle : () => { };
        this.onGoodNight = "onGoodNight" in params ? params.onGoodNight : () => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("dndActive", (params && "dndActive" in params) ? params.dndActive : false);
        this.resetParam("cleanRequested", (params && "cleanRequested" in params) ? params.cleanRequested : false);
        this.onDNDToggle = "onDNDToggle" in params ? params.onDNDToggle : () => { };
        this.onCleanToggle = "onCleanToggle" in params ? params.onCleanToggle : () => { };
        this.onGoodNight = "onGoodNight" in params ? params.onGoodNight : () => { };
    }
    @Param
    readonly dndActive: boolean;
    @Param
    readonly cleanRequested: boolean;
    @Event
    onDNDToggle: () => void;
    @Event
    onCleanToggle: () => void;
    @Event
    onGoodNight: () => void;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(10:5)", "@ohos/home");
            Column.width('100%');
            Column.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Column.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331714, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(11:7)", "@ohos/home");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Medium);
            Text.width('100%');
            Text.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(18:7)", "@ohos/home");
            Row.width('100%');
            Row.justifyContent(FlexAlign.SpaceBetween);
            Row.margin({ bottom: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(19:9)", "@ohos/home");
            Stack.width('48%');
            Stack.height(64);
            Stack.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Stack.backgroundColor(this.dndActive ? 'rgba(212, 177, 106, 0.35)' : 'rgba(255, 255, 255, 0.08)');
            Stack.onClick(() => {
                this.onDNDToggle();
            });
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331737, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(20:11)", "@ohos/home");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(25:11)", "@ohos/home");
            Row.width('100%');
            Row.height('100%');
            Row.justifyContent(FlexAlign.Center);
            Row.alignItems(VerticalAlign.Center);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331729, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(26:13)", "@ohos/home");
            Image.width({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.fillColor(this.dndActive ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : Color.Black);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331725, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(30:13)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(this.dndActive ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : Color.Black);
            Text.margin({ left: 8 });
        }, Text);
        Text.pop();
        Row.pop();
        Stack.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(48:9)", "@ohos/home");
            Stack.width('48%');
            Stack.height(64);
            Stack.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Stack.backgroundColor(this.cleanRequested ? 'rgba(212, 177, 106, 0.35)' : 'rgba(255, 255, 255, 0.08)');
            Stack.onClick(() => {
                this.onCleanToggle();
            });
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331737, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(49:11)", "@ohos/home");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(54:11)", "@ohos/home");
            Row.width('100%');
            Row.height('100%');
            Row.justifyContent(FlexAlign.Center);
            Row.alignItems(VerticalAlign.Center);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331706, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(55:13)", "@ohos/home");
            Image.width({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.fillColor(this.cleanRequested ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : Color.Black);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331724, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(59:13)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(this.cleanRequested ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : Color.Black);
            Text.margin({ left: 8 });
        }, Text);
        Text.pop();
        Row.pop();
        Stack.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(81:7)", "@ohos/home");
            Stack.width('100%');
            Stack.height(64);
            Stack.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Stack.clip(true);
            Stack.onClick(() => {
                this.onGoodNight();
            });
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331737, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(82:9)", "@ohos/home");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(88:9)", "@ohos/home");
            Row.width('100%');
            Row.height('100%');
            Row.alignItems(VerticalAlign.Center);
            Row.padding({ left: '30vp', right: '25vp' });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331708, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(89:11)", "@ohos/home");
            Image.width(32);
            Image.height(32);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(93:11)", "@ohos/home");
            Column.alignItems(HorizontalAlign.Start);
            Column.layoutWeight(1);
            Column.margin({ left: 12, right: 12 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331712, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(94:13)", "@ohos/home");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(Color.Black);
            Text.fontWeight(FontWeight.Medium);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331713, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(98:13)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor(Color.Black);
            Text.margin({ top: 4 });
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331727, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/ServiceStatus.ets(107:11)", "@ohos/home");
            Image.width(30);
            Image.height(30);
        }, Image);
        Row.pop();
        Stack.pop();
        Column.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("dndActive" in params) {
            this.updateParam("dndActive", params.dndActive);
        }
        if ("cleanRequested" in params) {
            this.updateParam("cleanRequested", params.cleanRequested);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
