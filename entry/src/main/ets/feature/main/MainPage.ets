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
      Text('首页')
        .fontSize(11)
        .fontColor(this.currentTab === 0 ?
          $r('app.color.primary') :
          $r('app.color.text_hint'))
        .margin({ top: 2 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(this.currentTab === 0 ?
      'rgba(74, 144, 217, 0.08)' :
      Color.Transparent)
  }

  @Builder
  tabLight() {
    Column() {
      Image(this.currentTab === 1 ?
        $r('app.media.tabs_icon_light_select') :
        $r('app.media.tabs_icon_light_unselect'))
        .width($r('app.float.icon_size_tab'))
        .height($r('app.float.icon_size_tab'))
      Text('灯光')
        .fontSize(11)
        .fontColor(this.currentTab === 1 ?
          $r('app.color.primary') :
          $r('app.color.text_hint'))
        .margin({ top: 2 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(this.currentTab === 1 ?
      'rgba(74, 144, 217, 0.08)' :
      Color.Transparent)
  }

  @Builder
  tabCurtain() {
    Column() {
      Image(this.currentTab === 2 ?
        $r('app.media.tabs_icon_curtain_select') :
        $r('app.media.tabs_icon_curtain_unselect'))
        .width($r('app.float.icon_size_tab'))
        .height($r('app.float.icon_size_tab'))
      Text('窗帘')
        .fontSize(11)
        .fontColor(this.currentTab === 2 ?
          $r('app.color.primary') :
          $r('app.color.text_hint'))
        .margin({ top: 2 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(this.currentTab === 2 ?
      'rgba(74, 144, 217, 0.08)' :
      Color.Transparent)
  }

  @Builder
  tabService() {
    Column() {
      Image(this.currentTab === 3 ?
        $r('app.media.tabs_icon_service_select') :
        $r('app.media.tabs_icon_service_unselect'))
        .width($r('app.float.icon_size_tab'))
        .height($r('app.float.icon_size_tab'))
      Text('服务')
        .fontSize(11)
        .fontColor(this.currentTab === 3 ?
          $r('app.color.primary') :
          $r('app.color.text_hint'))
        .margin({ top: 2 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(this.currentTab === 3 ?
      'rgba(74, 144, 217, 0.08)' :
      Color.Transparent)
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
    .barHeight(56)
    .barBackgroundColor($r('app.color.surface'))
    .animationDuration(200)
    .onChange((index: number) => {
      this.currentTab = index;
    })
    .width('100%')
    .height('100%')
  }
}
