import { LoginView as HarLoginPage } from '@ohos/login';

@ComponentV2
export struct LoginPage {
  @Consumer('pageStack') pageStack: NavPathStack = new NavPathStack();
  @Consumer('showTabBar') showTabBar: boolean = false;

  build() {
    NavDestination() {
      Stack() {
        HarLoginPage({
          onLoginSuccess: () => {
            this.showTabBar = true;
            this.pageStack.pushPath({ name: 'HomeTab' }, { animated: false });
          }
        })
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .backgroundColor(Color.Transparent)
  }
}
