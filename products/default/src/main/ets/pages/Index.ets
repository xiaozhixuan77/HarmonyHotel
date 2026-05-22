import { LoginPage as LoginDestination } from '../login/LoginPage';
import { MainPage as MainDestination } from './MainPage';

@Entry
@ComponentV2
struct Index {
  @Provider('pageStack') pageStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'LoginPage') {
      LoginDestination()
    } else if (name === 'MainPage') {
      MainDestination()
    }
  }

  aboutToAppear(): void {
    this.pageStack.pushPath({ name: 'LoginPage' });
  }

  build() {
    Navigation(this.pageStack) {
      Stack() {
        // NavBar 区域留空，由页面栈管理内容
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .hideNavBar(true)
    .navDestination(this.PageMap)
    .width('100%')
    .height('100%')
  }
}
