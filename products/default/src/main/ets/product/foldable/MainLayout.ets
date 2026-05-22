import { HomePage } from '@ohos/home';
import { LightPage } from '@ohos/light';
import { CurtainPage } from '@ohos/curtain';
import { ServicePage } from '@ohos/service';
import { TAB_CONFIGS, TabItemConfig } from '@ohos/common';

@ComponentV2
export struct FoldableMainLayout {
  @Param onLogout: () => void = () => {};
  @Local currentTab: number = 0;

  @Builder
  navItem(config: TabItemConfig, index: number) {
    Column() {
      Image(this.currentTab === index ? config.selectedIcon : config.unselectedIcon)
        .width(36)
        .height(36)

      Text(config.label)
        .fontSize(16)
        .fontColor(this.currentTab === index ? $r('app.color.gold') : $r('app.color.text_hint'))
        .margin({ top: 6 })
    }
    .width('100%')
    .height(90)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentTab = index;
    })
  }

  build() {
    Row() {
      Column() {
        ForEach(
          TAB_CONFIGS,
          (config: TabItemConfig, index: number) => {
            this.navItem(config, index);
          },
          (config: TabItemConfig) => config.label
        )
      }
      .width(160)
      .height('100%')
      .backgroundColor($r('app.color.background'))
      .padding({ top: 32, bottom: 32 })

      Stack() {
        if (this.currentTab === 0) {
          HomePage()
        } else if (this.currentTab === 1) {
          LightPage()
        } else if (this.currentTab === 2) {
          CurtainPage()
        } else if (this.currentTab === 3) {
          ServicePage({ onLogout: this.onLogout })
        }
      }
      .layoutWeight(1)
      .height('100%')
      .padding({ left: 32, right: 32 })
    }
    .width('100%')
    .height('100%')
  }
}
