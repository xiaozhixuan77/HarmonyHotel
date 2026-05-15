if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import { LoginPage as HarLoginPage } from "@normalized:N&&&@ohos/login/src/main/ets/Index&1.0.0";
export class LoginPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/login/LoginPage.ets(7:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new HarLoginPage(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/login/LoginPage.ets", line: 8, col: 7 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {};
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {});
                }
            }, { name: "HarLoginPage" });
        }
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "LoginPage";
    }
}
registerNamedRoute(() => new LoginPage(undefined, {}), "", { bundleName: "com.example.honysystem", moduleName: "entry", pagePath: "login/LoginPage", pageFullPath: "products/entry/src/main/ets/login/LoginPage", integratedHsp: "false", moduleType: "followWithHap" });
