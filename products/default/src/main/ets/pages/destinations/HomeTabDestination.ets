import { HomePage } from '@ohos/home';

@ComponentV2
export struct HomeTabDestination {
  build() {
    NavDestination() {
      HomePage()
    }
    .hideTitleBar(true)
    .backgroundColor(Color.Transparent)
  }
}
