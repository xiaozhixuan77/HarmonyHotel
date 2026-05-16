import { LoginPage as HarLoginPage } from '@ohos/login';

@ComponentV2
export struct LoginPage {
  @Consumer('pageStack') pageStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Stack() {
        HarLoginPage({
          onLoginSuccess: () => {
            this.pageStack.replacePath({ name: 'MainPage' });
          }
        })
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}
