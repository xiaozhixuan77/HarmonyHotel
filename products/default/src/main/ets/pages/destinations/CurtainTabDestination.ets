import { CurtainPage } from '@ohos/curtain';

@ComponentV2
export struct CurtainTabDestination {
  build() {
    NavDestination() {
      CurtainPage()
    }
    .hideTitleBar(true)
    .backgroundColor(Color.Transparent)
  }
}
