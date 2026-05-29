import { window } from '@kit.ArkUI';
import { getBreakpoint } from '@ohos/utils';
import { PhoneMainLayout } from '../product/phone/MainLayout';
import { TabletMainLayout } from '../product/tablet/MainLayout';
import { FoldableMainLayout } from '../product/foldable/MainLayout';

@ComponentV2
export struct MainPage {
  @Local currentBreakpoint: string = 'sm';
  @Consumer('pageStack') pageStack: NavPathStack = new NavPathStack();
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
    } catch (e) {
      this.currentBreakpoint = 'sm';
    }
  }

  aboutToDisappear(): void {
    if (this.windowChangeCallback) {
      try {
        const ctx = getContext(this);
        window.getLastWindow(ctx).then((win) => {
          win.off('windowSizeChange', this.windowChangeCallback);
        }).catch(() => {});
      } catch (e) {}
    }
  }

  private handleLogout(): void {
    this.pageStack.replacePath({ name: 'LoginPage' });
  }

  build() {
    NavDestination() {
      Stack() {
        if (this.currentBreakpoint === 'sm') {
          PhoneMainLayout({ onLogout: () => this.handleLogout() })
        } else if (this.currentBreakpoint === 'md') {
          TabletMainLayout({ onLogout: () => this.handleLogout() })
        } else {
          FoldableMainLayout({ onLogout: () => this.handleLogout() })
        }
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}
