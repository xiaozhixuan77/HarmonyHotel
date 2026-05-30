import { window } from '@kit.ArkUI';
import { getBreakpoint } from '@ohos/utils';
import { LoginPage as LoginDestination } from '../login/LoginPage';
import { HomeTabDestination } from './destinations/HomeTabDestination';
import { LightTabDestination } from './destinations/LightTabDestination';
import { CurtainTabDestination } from './destinations/CurtainTabDestination';
import { ServiceTabDestination } from './destinations/ServiceTabDestination';
import { PhoneTabBar, SideTabBar } from './TabBar';

@Entry
@ComponentV2
struct Index {
  @Provider('pageStack') pageStack: NavPathStack = new NavPathStack();
  @Provider('showTabBar') showTabBar: boolean = false;
  @Provider('currentBreakpoint') currentBreakpoint: string = 'sm';
  private windowChangeCallback?: (size: window.Size) => void;

  @Builder
  PageMap(name: string) {
    if (name === 'LoginPage') {
      LoginDestination()
    } else if (name === 'HomeTab') {
      HomeTabDestination()
    } else if (name === 'LightTab') {
      LightTabDestination()
    } else if (name === 'CurtainTab') {
      CurtainTabDestination()
    } else if (name === 'ServiceTab') {
      ServiceTabDestination()
    }
  }

  async aboutToAppear(): Promise<void> {
    try {
      const ctx = getContext(this);
      const win = await window.getLastWindow(ctx);
      const rect = win.getWindowProperties().windowRect;
      this.currentBreakpoint = getBreakpoint(px2vp(rect.width));

      this.windowChangeCallback = (size: window.Size): void => {
        this.currentBreakpoint = getBreakpoint(px2vp(size.width));
      };
      win.on('windowSizeChange', this.windowChangeCallback);
    } catch (e) {
      this.currentBreakpoint = 'sm';
    }

    this.pageStack.pushPath({ name: 'LoginPage' });
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
      Image($r('app.media.home_background'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column() {
        Row() {
          if (this.showTabBar && this.currentBreakpoint !== 'sm') {
            SideTabBar({
              iconSize: this.currentBreakpoint === 'md' ? 32 : 36,
              fontSize: this.currentBreakpoint === 'md' ? 14 : 16,
              itemHeight: this.currentBreakpoint === 'md' ? 80 : 90,
              labelMarginTop: this.currentBreakpoint === 'md' ? 4 : 6
            })
              .width(this.currentBreakpoint === 'md' ? 120 : 160)
              .height('100%')
          }

          Navigation(this.pageStack) {
            Stack()
              .width('100%')
              .height('100%')
          }
          .navDestination(this.PageMap)
          .hideTitleBar(true)
          .hideNavBar(true)
          .layoutWeight(1)
          .backgroundColor(Color.Transparent)
        }
        .layoutWeight(1)

        if (this.showTabBar && this.currentBreakpoint === 'sm') {
          PhoneTabBar()
            .width('100%')
            .height($r('app.float.tab_bar_height'))
            .backgroundColor('rgba(0,0,0,0.4)')
        }
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
