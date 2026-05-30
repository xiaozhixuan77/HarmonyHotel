import { LightPage } from '@ohos/light';

@ComponentV2
export struct LightTabDestination {
  build() {
    NavDestination() {
      LightPage()
    }
    .hideTitleBar(true)
    .backgroundColor(Color.Transparent)
  }
}
