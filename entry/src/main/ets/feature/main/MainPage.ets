import { window } from '@kit.ArkUI';
import { getBreakpoint } from '../../common/utils/BreakpointUtil';
import { PhoneMainLayout } from '../../product/phone/MainLayout';
import { TabletMainLayout } from '../../product/tablet/MainLayout';
import { FoldableMainLayout } from '../../product/foldable/MainLayout';

@Entry
@ComponentV2
struct MainPage {
  @Local currentBreakpoint: string = 'sm';
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

  build() {
    Stack() {
      if (this.currentBreakpoint === 'sm') {
        PhoneMainLayout()
      } else if (this.currentBreakpoint === 'md') {
        TabletMainLayout()
      } else {
        FoldableMainLayout()
      }
    }
    .width('100%')
    .height('100%')
  }
}
