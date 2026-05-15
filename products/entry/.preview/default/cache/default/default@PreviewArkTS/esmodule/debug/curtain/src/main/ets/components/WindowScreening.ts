if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import type { CurtainState } from '@ohos/common';
export class WindowScreening extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("state", (params && "state" in params) ? params.state : 'close');
        this.onStateChange = "onStateChange" in params ? params.onStateChange : (_state: CurtainState) => { };
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("state", (params && "state" in params) ? params.state : 'close');
        this.onStateChange = "onStateChange" in params ? params.onStateChange : (_state: CurtainState) => { };
    }
    @Param
    readonly state: CurtainState;
    @Event
    onStateChange: (state: CurtainState) => void;
    private getLeftOffset(): number {
        if (this.state === 'open') {
            return -100;
        }
        else if (this.state === 'pause' || this.state === 'half') {
            return -30;
        }
        return 0;
    }
    private getRightOffset(): number {
        if (this.state === 'open') {
            return 100;
        }
        else if (this.state === 'pause' || this.state === 'half') {
            return 30;
        }
        return 0;
    }
    private getBtnBg(isSelected: boolean): Resource {
        return isSelected ? { "id": 50331781, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331765, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(31:5)", "@ohos/curtain");
            Stack.width('100%');
            Stack.height(260);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331789, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(32:7)", "@ohos/curtain");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(38:7)", "@ohos/curtain");
            Column.width('100%');
            Column.height('100%');
            Column.padding({ left: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331778, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(39:9)", "@ohos/curtain");
            Text.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Medium);
            Text.width('100%');
            Text.margin({ top: 12, bottom: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331764, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(45:9)", "@ohos/curtain");
            Image.width(170);
            Image.height(5);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(49:9)", "@ohos/curtain");
            Row.width('100%');
            Row.height(110);
            Row.justifyContent(FlexAlign.Center);
            Row.alignItems(VerticalAlign.Center);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(50:11)", "@ohos/curtain");
            Stack.width(90);
            Stack.height(100);
            Stack.clip(true);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331780, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(51:13)", "@ohos/curtain");
            Context.animation({ duration: 500, curve: Curve.EaseInOut });
            Image.width(100);
            Image.height(100);
            Image.objectFit(ImageFit.Contain);
            Image.translate({ x: this.getLeftOffset() });
            Context.animation(null);
        }, Image);
        Stack.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(62:11)", "@ohos/curtain");
            Stack.width(90);
            Stack.height(100);
            Stack.clip(true);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331785, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(63:13)", "@ohos/curtain");
            Context.animation({ duration: 500, curve: Curve.EaseInOut });
            Image.width(100);
            Image.height(100);
            Image.objectFit(ImageFit.Contain);
            Image.translate({ x: this.getRightOffset() });
            Context.animation(null);
        }, Image);
        Stack.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(79:9)", "@ohos/curtain");
            Row.width('100%');
            Row.height(80);
            Row.justifyContent(FlexAlign.SpaceAround);
            Row.alignItems(VerticalAlign.Center);
            Row.margin({ top: 4, bottom: 8 });
        }, Row);
        this.ScreenBtn.bind(this)('open', this.state === 'open', () => {
            this.onStateChange('open');
        });
        this.ScreenBtn.bind(this)('pause', this.state === 'pause', () => {
            this.onStateChange('pause');
        });
        this.ScreenBtn.bind(this)('close', this.state === 'close', () => {
            this.onStateChange('close');
        });
        Row.pop();
        Column.pop();
        Stack.pop();
    }
    ScreenBtn(action: string, isSelected: boolean, onClick: () => void, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(106:5)", "@ohos/curtain");
            Column.width('33%');
            Column.alignItems(HorizontalAlign.Center);
            Column.onClick(onClick);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(107:7)", "@ohos/curtain");
            Stack.width(48);
            Stack.height(48);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.getBtnBg(isSelected));
            Image.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(108:9)", "@ohos/curtain");
            Image.width(48);
            Image.height(48);
            Image.objectFit(ImageFit.Fill);
            Image.borderRadius(24);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.getActionIcon(action));
            Image.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(114:9)", "@ohos/curtain");
            Image.width(20);
            Image.height(20);
            Image.objectFit(ImageFit.Contain);
            Image.fillColor(isSelected ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        Stack.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.getActionLabel(action));
            Text.debugLine("features/curtain/src/main/ets/components/WindowScreening.ets(123:7)", "@ohos/curtain");
            Text.fontSize(12);
            Text.fontColor(isSelected ? { "id": 50331687, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 4 });
        }, Text);
        Text.pop();
        Column.pop();
    }
    private getActionIcon(action: string): Resource {
        if (action === 'open') {
            return { "id": 50331786, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
        }
        else if (action === 'pause') {
            return { "id": 50331771, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
        }
        else if (action === 'close') {
            return { "id": 50331783, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
        }
        return { "id": 50331786, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
    }
    private getActionLabel(action: string): ResourceStr {
        if (action === 'open') {
            return { "id": 50331776, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
        }
        else if (action === 'pause') {
            return { "id": 50331777, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
        }
        else if (action === 'close') {
            return { "id": 50331774, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" };
        }
        return '';
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("state" in params) {
            this.updateParam("state", params.state);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
