import { HomePage } from '@ohos/home';
import { LightPage } from '@ohos/light';
import { CurtainPage } from '@ohos/curtain';
import { ServicePage } from '@ohos/service';

@ComponentV2
export struct PhoneMainLayout {
  @Local currentTab: number = 0;

  @Builder
  tabHome() {
    Stack() {
      if (this.currentTab === 0) {
        Image($r('app.media.tabs_icon_bg_selected'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
      }
      Column() {
        Image(this.currentTab === 0 ?
          $r('app.media.tabs_icon_home_select') :
          $r('app.media.tabs_icon_home_unselect'))
          .width($r('app.float.icon_size_tab'))
          .height($r('app.float.icon_size_tab'))
        Text($r('app.string.tab_home'))
          .fontSize($r('app.float.text_caption'))
          .fontColor(this.currentTab === 0 ?
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

  @Builder
  tabLight() {
    Stack() {
      if (this.currentTab === 1) {
        Image($r('app.media.tabs_icon_bg_selected'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
      }
      Column() {
        Image(this.currentTab === 1 ?
          $r('app.media.tabs_icon_light_select') :
          $r('app.media.tabs_icon_light_unselect'))
          .width($r('app.float.icon_size_tab'))
          .height($r('app.float.icon_size_tab'))
        Text($r('app.string.tab_light'))
          .fontSize($r('app.float.text_caption'))
          .fontColor(this.currentTab === 1 ?
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

  @Builder
  tabCurtain() {
    Stack() {
      if (this.currentTab === 2) {
        Image($r('app.media.tabs_icon_bg_selected'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
      }
      Column() {
        Image(this.currentTab === 2 ?
          $r('app.media.tabs_icon_curtain_select') :
          $r('app.media.tabs_icon_curtain_unselect'))
          .width($r('app.float.icon_size_tab'))
          .height($r('app.float.icon_size_tab'))
        Text($r('app.string.tab_curtain'))
          .fontSize($r('app.float.text_caption'))
          .fontColor(this.currentTab === 2 ?
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

  @Builder
  tabService() {
    Stack() {
      if (this.currentTab === 3) {
        Image($r('app.media.tabs_icon_bg_selected'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
      }
      Column() {
        Image(this.currentTab === 3 ?
          $r('app.media.tabs_icon_service_select') :
          $r('app.media.tabs_icon_service_unselect'))
          .width($r('app.float.icon_size_tab'))
          .height($r('app.float.icon_size_tab'))
        Text($r('app.string.tab_service'))
          .fontSize($r('app.float.text_caption'))
          .fontColor(this.currentTab === 3 ?
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
    Stack({alignContent: Alignment.Bottom}) {
      Tabs({
        index: this.currentTab,
        barPosition: BarPosition.End
      }) {
        TabContent() {
          HomePage()
        }

        TabContent() {
          LightPage()
        }

        TabContent() {
          CurtainPage()
        }

        TabContent() {
          ServicePage()
        }
      }
      .barHeight(0)
      .backgroundColor('rgba(0,0,0,0)')
      .animationDuration(200)
      .onChange((index: number) => {
        this.currentTab = index;
      })
      .width('100%')
      .height('100%')

      Image($r('app.media.tabs_bg'))
        .width('100%')
        .height($r('app.float.tab_bar_height'))
        .objectFit(ImageFit.Fill)
        .align(Alignment.Bottom)

      Row() {
        Column() {
          this.tabHome()
        }
        .layoutWeight(1)
        .height('100%')
        .onClick(() => {
          this.currentTab = 0;
        })

        Column() {
          this.tabLight()
        }
        .layoutWeight(1)
        .height('100%')
        .onClick(() => {
          this.currentTab = 1;
        })

        Column() {
          this.tabCurtain()
        }
        .layoutWeight(1)
        .height('100%')
        .onClick(() => {
          this.currentTab = 2;
        })

        Column() {
          this.tabService()
        }
        .layoutWeight(1)
        .height('100%')
        .onClick(() => {
          this.currentTab = 3;
        })
      }
      .width('100%')
      .height($r('app.float.tab_bar_height'))
      .align(Alignment.Bottom)
    }
    .width('100%')
    .height('100%')
  }
}
