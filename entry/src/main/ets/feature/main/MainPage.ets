import { HomePage } from '../home/HomePage';
import { LightPage } from '../light/LightPage';
import { CurtainPage } from '../curtain/CurtainPage';
import { ServicePage } from '../service/ServicePage';

@Entry
@ComponentV2
struct MainPage {
  @Local currentTab: number = 0;

  @Builder
  tabHome() {
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

  @Builder
  tabLight() {
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

  @Builder
  tabCurtain() {
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

  @Builder
  tabService() {
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

  build() {
    Tabs({
      index: this.currentTab,
      barPosition: BarPosition.End
    }) {
      TabContent() {
        HomePage()
      }
      .tabBar(this.tabHome)

      TabContent() {
        LightPage()
      }
      .tabBar(this.tabLight)

      TabContent() {
        CurtainPage()
      }
      .tabBar(this.tabCurtain)

      TabContent() {
        ServicePage()
      }
      .tabBar(this.tabService)
    }
    .barHeight($r('app.float.tab_bar_height'))
    .barBackgroundColor($r('app.color.tab_bar_bg'))
    .animationDuration(200)
    .onChange((index: number) => {
      this.currentTab = index;
    })
    .width('100%')
    .height('100%')
  }
}
