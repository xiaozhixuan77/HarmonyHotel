import { HomePage } from '@ohos/home';
import { LightPage } from '@ohos/light';
import { CurtainPage } from '@ohos/curtain';
import { ServicePage } from '@ohos/service';
import { TAB_CONFIGS, TabItemConfig } from '@ohos/uicomponents';

@ComponentV2
export struct TabletMainLayout {
  @Param onLogout: () => void = () => {};
  @Local currentTab: number = 0;

  @Builder
  navItem(config: TabItemConfig, index: number) {
    Column() {
      Image(this.currentTab === index ? config.selectedIcon : config.unselectedIcon)
        .width(32)
        .height(32)

      Text(config.label)
        .fontSize(14)
        .fontColor(this.currentTab === index ? $r('app.color.gold') : $r('app.color.text_hint'))
        .margin({ top: 4 })
    }
    .width('100%')
    .height(80)
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
      .width(120)
      .height('100%')
      .backgroundColor($r('app.color.background'))
      .padding({ top: 24, bottom: 24 })

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
    }
    .width('100%')
    .height('100%')
  }
}
