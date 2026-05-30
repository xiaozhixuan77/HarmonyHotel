import { TabItemConfig, TAB_CONFIGS } from '@ohos/uicomponents';

@ComponentV2
export struct PhoneTabBar {
  @Consumer('pageStack') pageStack: NavPathStack = new NavPathStack();
  @Local activeIndex: number = 0;
  private tabRoutes: string[] = ['HomeTab', 'LightTab', 'CurtainTab', 'ServiceTab'];

  private switchTab(index: number): void {
    if (this.activeIndex === index) {
      return;
    }
    this.activeIndex = index;
    this.pageStack.replacePath({ name: this.tabRoutes[index] });
  }

  @Builder
  tabItem(config: TabItemConfig, index: number) {
    Stack() {
      if (this.activeIndex === index) {
        Image($r('app.media.tabs_icon_bg_selected'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
      }
      Column() {
        Image(this.activeIndex === index ?
          config.selectedIcon :
          config.unselectedIcon)
          .width($r('app.float.icon_size_tab'))
          .height($r('app.float.icon_size_tab'))
        Text(config.label)
          .fontSize($r('app.float.text_caption'))
          .fontColor(this.activeIndex === index ?
            $r('app.color.gold') :
            $r('app.color.text_hint'))
          .margin({ top: 2 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.tabs_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)

      Row() {
        ForEach(TAB_CONFIGS, (config: TabItemConfig, index: number) => {
          Column() {
            this.tabItem(config, index)
          }
          .layoutWeight(1)
          .height('100%')
          .onClick(() => {
            this.switchTab(index);
          })
        })
      }
      .width('100%')
      .height('100%')
    }
  }
}

@ComponentV2
export struct SideTabBar {
  @Consumer('pageStack') pageStack: NavPathStack = new NavPathStack();
  @Local activeIndex: number = 0;
  @Param iconSize: number = 32;
  @Param fontSize: number = 14;
  @Param itemHeight: number = 80;
  @Param labelMarginTop: number = 4;
  private tabRoutes: string[] = ['HomeTab', 'LightTab', 'CurtainTab', 'ServiceTab'];

  private switchTab(index: number): void {
    if (this.activeIndex === index) {
      return;
    }
    this.activeIndex = index;
    this.pageStack.replacePath({ name: this.tabRoutes[index] });
  }

  @Builder
  navItem(config: TabItemConfig, index: number) {
    Column() {
      Image(this.activeIndex === index ?
        config.selectedIcon :
        config.unselectedIcon)
        .width(this.iconSize)
        .height(this.iconSize)
      Text(config.label)
        .fontSize(this.fontSize)
        .fontColor(this.activeIndex === index ?
          $r('app.color.gold') :
          $r('app.color.text_hint'))
        .margin({ top: this.labelMarginTop })
    }
    .width('100%')
    .height(this.itemHeight)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.switchTab(index);
    })
  }

  build() {
    Column() {
      ForEach(TAB_CONFIGS, (config: TabItemConfig, index: number) => {
        this.navItem(config, index)
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background'))
  }
}
