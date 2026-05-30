import { ServicePage } from '@ohos/service';

@ComponentV2
export struct ServiceTabDestination {
  @Consumer('pageStack') pageStack: NavPathStack = new NavPathStack();
  @Consumer('showTabBar') showTabBar: boolean = false;

  build() {
    NavDestination() {
      ServicePage({
        onLogout: (): void => {
          this.showTabBar = false;
          this.pageStack.popToName('LoginPage');
        }
      })
    }
    .hideTitleBar(true)
    .backgroundColor(Color.Transparent)
  }
}
