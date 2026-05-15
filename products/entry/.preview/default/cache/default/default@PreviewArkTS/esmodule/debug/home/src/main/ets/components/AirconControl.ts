if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
export class AirconControl extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("settingTemp", (params && "settingTemp" in params) ? params.settingTemp : 22);
        this.initParam("currentTemp", (params && "currentTemp" in params) ? params.currentTemp : 19);
        this.initParam("isOn", (params && "isOn" in params) ? params.isOn : true);
        this.initParam("isLoading", (params && "isLoading" in params) ? params.isLoading : false);
        this.onTempUp = "onTempUp" in params ? params.onTempUp : () => { };
        this.onTempDown = "onTempDown" in params ? params.onTempDown : () => { };
        this.onPowerToggle = "onPowerToggle" in params ? params.onPowerToggle : () => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("settingTemp", (params && "settingTemp" in params) ? params.settingTemp : 22);
        this.resetParam("currentTemp", (params && "currentTemp" in params) ? params.currentTemp : 19);
        this.resetParam("isOn", (params && "isOn" in params) ? params.isOn : true);
        this.resetParam("isLoading", (params && "isLoading" in params) ? params.isLoading : false);
        this.onTempUp = "onTempUp" in params ? params.onTempUp : () => { };
        this.onTempDown = "onTempDown" in params ? params.onTempDown : () => { };
        this.onPowerToggle = "onPowerToggle" in params ? params.onPowerToggle : () => { };
    }
    @Param
    readonly settingTemp: number;
    @Param
    readonly currentTemp: number;
    @Param
    readonly isOn: boolean;
    @Param
    readonly isLoading: boolean;
    @Event
    onTempUp: () => void;
    @Event
    onTempDown: () => void;
    @Event
    onPowerToggle: () => void;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/home/src/main/ets/components/AirconControl.ets(12:5)", "@ohos/home");
            Stack.width('100%');
            Stack.height('150vp');
            Stack.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Stack.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Stack.clip(true);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331733, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/AirconControl.ets(13:7)", "@ohos/home");
            Image.objectFit(ImageFit.Fill);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/AirconControl.ets(16:7)", "@ohos/home");
            Column.width('100%');
            Column.padding({ "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/AirconControl.ets(17:9)", "@ohos/home");
            Row.width('100%');
            Row.margin({ bottom: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/AirconControl.ets(18:11)", "@ohos/home");
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331709, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/AirconControl.ets(19:13)", "@ohos/home");
            Image.width(40);
            Image.height(40);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/AirconControl.ets(22:13)", "@ohos/home");
            Column.alignItems(HorizontalAlign.Start);
            Column.margin({ left: 8 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331710, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/AirconControl.ets(23:15)", "@ohos/home");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Medium);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.isOn) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create({ "id": 50331711, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Text.debugLine("features/home/src/main/ets/components/AirconControl.ets(28:17)", "@ohos/home");
                        Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                        Text.fontColor('#50C878');
                    }, Text);
                    Text.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331717, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/AirconControl.ets(35:13)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ left: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.settingTemp + '°C');
            Text.debugLine("features/home/src/main/ets/components/AirconControl.ets(39:13)", "@ohos/home");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 4, bottom: 4 });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
            Blank.debugLine("features/home/src/main/ets/components/AirconControl.ets(45:11)", "@ohos/home");
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331738, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/AirconControl.ets(47:11)", "@ohos/home");
            Image.width(40);
            Image.height(40);
            Image.opacity(this.isOn ? 0.5 : 1.0);
            Image.onClick(() => {
                this.onPowerToggle();
            });
        }, Image);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/home/src/main/ets/components/AirconControl.ets(58:9)", "@ohos/home");
            Row.width('100%');
            Row.justifyContent(FlexAlign.SpaceBetween);
            Row.alignItems(VerticalAlign.Center);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/AirconControl.ets(59:11)", "@ohos/home");
            Column.alignItems(HorizontalAlign.Center);
            Column.layoutWeight(1);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331707, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/AirconControl.ets(61:13)", "@ohos/home");
            Image.width({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.enabled(!this.isLoading && this.settingTemp > 16);
            Image.opacity(this.settingTemp <= 16 ? 0.4 : 1.0);
            Image.onClick(() => {
                this.onTempDown();
            });
        }, Image);
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/AirconControl.ets(73:11)", "@ohos/home");
            Column.alignItems(HorizontalAlign.Center);
            Column.layoutWeight(1);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331718, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/home/src/main/ets/components/AirconControl.ets(74:13)", "@ohos/home");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.settingTemp + '°C');
            Text.debugLine("features/home/src/main/ets/components/AirconControl.ets(77:13)", "@ohos/home");
            Text.fontSize(40);
            Text.fontWeight(FontWeight.Bold);
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 4 });
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/home/src/main/ets/components/AirconControl.ets(86:11)", "@ohos/home");
            Column.alignItems(HorizontalAlign.Center);
            Column.layoutWeight(1);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331736, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/home/src/main/ets/components/AirconControl.ets(87:13)", "@ohos/home");
            Image.width({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331672, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.enabled(!this.isLoading && this.settingTemp < 30);
            Image.opacity(this.settingTemp >= 30 ? 0.4 : 1.0);
            Image.onClick(() => {
                this.onTempUp();
            });
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.isLoading) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        LoadingProgress.create();
                        LoadingProgress.debugLine("features/home/src/main/ets/components/AirconControl.ets(104:11)", "@ohos/home");
                        LoadingProgress.width(24);
                        LoadingProgress.height(24);
                        LoadingProgress.margin({ top: 8 });
                        LoadingProgress.color({ "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
                    }, LoadingProgress);
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        Column.pop();
        Stack.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("settingTemp" in params) {
            this.updateParam("settingTemp", params.settingTemp);
        }
        if ("currentTemp" in params) {
            this.updateParam("currentTemp", params.currentTemp);
        }
        if ("isOn" in params) {
            this.updateParam("isOn", params.isOn);
        }
        if ("isLoading" in params) {
            this.updateParam("isLoading", params.isLoading);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
