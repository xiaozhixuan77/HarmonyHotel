if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import window from "@ohos:window";
import { getBreakpoint } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { PhoneMainLayout } from "@normalized:N&&&entry/src/main/ets/product/phone/MainLayout&";
import { TabletMainLayout } from "@normalized:N&&&entry/src/main/ets/product/tablet/MainLayout&";
import { FoldableMainLayout } from "@normalized:N&&&entry/src/main/ets/product/foldable/MainLayout&";
class MainPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.currentBreakpoint = 'sm';
        this.windowChangeCallback = undefined;
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.currentBreakpoint = 'sm';
    }
    @Local
    currentBreakpoint: string;
    private windowChangeCallback?: (size: window.Size) => void;
    async aboutToAppear(): Promise<void> {
        try {
            const ctx = getContext(this);
            const win = await window.getLastWindow(ctx);
            const rect = win.getWindowProperties().windowRect;
            this.currentBreakpoint = getBreakpoint(px2vp(rect.width));
            this.windowChangeCallback = (size: window.Size) => {
                this.currentBreakpoint = getBreakpoint(px2vp(size.width));
            };
            win.on('windowSizeChange', this.windowChangeCallback);
        }
        catch (e) {
            this.currentBreakpoint = 'sm';
        }
    }
    aboutToDisappear(): void {
        if (this.windowChangeCallback) {
            try {
                const ctx = getContext(this);
                window.getLastWindow(ctx).then((win) => {
                    win.off('windowSizeChange', this.windowChangeCallback);
                }).catch(() => { });
            }
            catch (e) { }
        }
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("products/entry/src/main/ets/pages/MainPage.ets(41:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentBreakpoint === 'sm') {
                this.ifElseBranchUpdateFunction(0, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new PhoneMainLayout(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/pages/MainPage.ets", line: 43, col: 9 });
                                ViewV2.create(componentCall);
                                let paramsLambda = () => {
                                    return {};
                                };
                                componentCall.paramsGenerator_ = paramsLambda;
                            }
                            else {
                                this.updateStateVarsOfChildByElmtId(elmtId, {});
                            }
                        }, { name: "PhoneMainLayout" });
                    }
                });
            }
            else if (this.currentBreakpoint === 'md') {
                this.ifElseBranchUpdateFunction(1, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new TabletMainLayout(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/pages/MainPage.ets", line: 45, col: 9 });
                                ViewV2.create(componentCall);
                                let paramsLambda = () => {
                                    return {};
                                };
                                componentCall.paramsGenerator_ = paramsLambda;
                            }
                            else {
                                this.updateStateVarsOfChildByElmtId(elmtId, {});
                            }
                        }, { name: "TabletMainLayout" });
                    }
                });
            }
            else {
                this.ifElseBranchUpdateFunction(2, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new FoldableMainLayout(this, {}, undefined, elmtId, () => { }, { page: "products/entry/src/main/ets/pages/MainPage.ets", line: 47, col: 9 });
                                ViewV2.create(componentCall);
                                let paramsLambda = () => {
                                    return {};
                                };
                                componentCall.paramsGenerator_ = paramsLambda;
                            }
                            else {
                                this.updateStateVarsOfChildByElmtId(elmtId, {});
                            }
                        }, { name: "FoldableMainLayout" });
                    }
                });
            }
        }, If);
        If.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "MainPage";
    }
}
registerNamedRoute(() => new MainPage(undefined, {}), "", { bundleName: "com.example.honysystem", moduleName: "entry", pagePath: "pages/MainPage", pageFullPath: "products/entry/src/main/ets/pages/MainPage", integratedHsp: "false", moduleType: "followWithHap" });
