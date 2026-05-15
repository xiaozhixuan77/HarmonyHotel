if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import type common from "@ohos:app.ability.common";
import promptAction from "@ohos:promptAction";
import router from "@ohos:router";
import { LoginViewModel } from "@normalized:N&&&@ohos/login/src/main/ets/LoginViewModel&1.0.0";
export class LoginPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.viewModel = new LoginViewModel();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.viewModel = new LoginViewModel();
    }
    @Local
    viewModel: LoginViewModel;
    async aboutToAppear(): Promise<void> {
        const context: common.Context = getContext(this) as common.Context;
        await this.viewModel.loadSavedInfo(context);
        const autoLogin: boolean = await this.viewModel.checkAutoLogin(context);
        if (autoLogin) {
            router.replaceUrl({ url: 'pages/MainPage' });
        }
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("features/login/src/main/ets/LoginPage.ets(20:5)", "@ohos/login");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331695, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/login/src/main/ets/LoginPage.ets(21:7)", "@ohos/login");
            Image.width('100%');
            Image.height('100%');
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/login/src/main/ets/LoginPage.ets(26:7)", "@ohos/login");
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("features/login/src/main/ets/LoginPage.ets(27:9)", "@ohos/login");
            Column.width('85%');
            Column.padding({ "id": 50331676, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Column.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Column.backgroundColor({ "id": 50331684, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Column.backdropBlur(10);
            Column.border({
                width: 1,
                color: 'rgba(255, 255, 255, 0.12)'
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331698, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/login/src/main/ets/LoginPage.ets(28:11)", "@ohos/login");
            Text.fontSize('35vp');
            Text.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontWeight(FontWeight.Bold);
            Text.textAlign(TextAlign.Center);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331697, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/login/src/main/ets/LoginPage.ets(35:11)", "@ohos/login");
            Text.fontSize('19vp');
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.margin({ top: 10, bottom: 28 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/login/src/main/ets/LoginPage.ets(40:11)", "@ohos/login");
            Row.width('100%');
            Row.padding({ left: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
            Row.height({ "id": 50331679, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.backgroundColor('rgba(255, 255, 255, 0.12)');
            Row.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331705, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/login/src/main/ets/LoginPage.ets(41:13)", "@ohos/login");
            Image.width({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.margin({ right: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, left: 5 });
            Image.fillColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({
                placeholder: { "id": 50331700, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
                text: this.viewModel.roomNo
            });
            TextInput.debugLine("features/login/src/main/ets/LoginPage.ets(46:13)", "@ohos/login");
            TextInput.type(InputType.Number);
            TextInput.placeholderColor({ "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            TextInput.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            TextInput.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            TextInput.layoutWeight(1);
            TextInput.backgroundColor(Color.Transparent);
            TextInput.onChange((value: string) => {
                this.viewModel.roomNo = value;
            });
        }, TextInput);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/login/src/main/ets/LoginPage.ets(67:11)", "@ohos/login");
            Row.width('100%');
            Row.padding({ left: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }, right: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
            Row.height({ "id": 50331679, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.borderRadius({ "id": 50331675, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Row.backgroundColor('rgba(255, 255, 255, 0.12)');
            Row.margin({ bottom: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 50331703, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/login/src/main/ets/LoginPage.ets(68:13)", "@ohos/login");
            Image.width({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.height({ "id": 50331673, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.margin({ right: { "id": 50331678, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
            Image.fillColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({
                placeholder: { "id": 50331701, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
                text: this.viewModel.firstName
            });
            TextInput.debugLine("features/login/src/main/ets/LoginPage.ets(73:13)", "@ohos/login");
            TextInput.placeholderColor({ "id": 50331691, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            TextInput.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            TextInput.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            TextInput.layoutWeight(1);
            TextInput.backgroundColor(Color.Transparent);
            TextInput.onChange((value: string) => {
                this.viewModel.firstName = value;
            });
        }, TextInput);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("features/login/src/main/ets/LoginPage.ets(93:11)", "@ohos/login");
            Row.width('100%');
            Row.padding({ left: 4 });
            Row.margin({ bottom: 28 });
            Row.onClick(() => {
                this.viewModel.rememberMe = !this.viewModel.rememberMe;
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.viewModel.rememberMe ? { "id": 50331704, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } : { "id": 50331702, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Image.debugLine("features/login/src/main/ets/LoginPage.ets(94:13)", "@ohos/login");
            Image.width(20);
            Image.height(20);
            Image.margin({ right: 8 });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 50331699, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.debugLine("features/login/src/main/ets/LoginPage.ets(100:13)", "@ohos/login");
            Text.fontSize({ "id": 50331681, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Text.fontColor({ "id": 50331693, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 50331696, "type": 10003, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Button.debugLine("features/login/src/main/ets/LoginPage.ets(111:11)", "@ohos/login");
            Button.type(ButtonType.Capsule);
            Button.width('100%');
            Button.height({ "id": 50331679, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Button.fontSize({ "id": 50331680, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Button.fontColor({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Button.backgroundColor({ "id": 50331688, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
            Button.enabled(!this.viewModel.isLoading);
            Button.opacity(this.viewModel.isLoading ? 0.7 : 1.0);
            Button.onClick(async () => {
                const context: common.Context = getContext(this) as common.Context;
                const success: boolean = await this.viewModel.login(context);
                if (success) {
                    router.replaceUrl({ url: 'pages/MainPage' });
                }
                else if (this.viewModel.errorMsg.length > 0) {
                    promptAction.showToast({
                        message: this.viewModel.errorMsg,
                        duration: 2000
                    });
                }
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.viewModel.isLoading) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        LoadingProgress.create();
                        LoadingProgress.debugLine("features/login/src/main/ets/LoginPage.ets(134:13)", "@ohos/login");
                        LoadingProgress.width(36);
                        LoadingProgress.height(36);
                        LoadingProgress.margin({ top: { "id": 50331677, "type": 10002, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" } });
                        LoadingProgress.color({ "id": 50331692, "type": 10001, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" });
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
        Column.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "LoginPage";
    }
}
registerNamedRoute(() => new LoginPage(undefined, {}), "", { bundleName: "com.example.honysystem", moduleName: "entry", pagePath: "../../../../../features/login/src/main/ets/LoginPage", pageFullPath: "features/login/src/main/ets/LoginPage", integratedHsp: "false", moduleType: "followWithHap" });
