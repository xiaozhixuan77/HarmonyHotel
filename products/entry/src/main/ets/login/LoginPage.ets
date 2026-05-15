import { LoginPage as HarLoginPage } from '@ohos/login';

@Entry
@ComponentV2
export struct LoginPage {
  build() {
    Stack() {
      HarLoginPage()
    }
    .width('100%')
    .height('100%')
  }
}
