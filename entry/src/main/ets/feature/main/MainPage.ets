@Entry
@ComponentV2
struct MainPage {
  build() {
    Column() {
      Text($r('app.string.home_title'))
        .fontSize($r('app.float.text_title'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)

      Text('待步骤四实现 TabBar + Navigation')
        .fontSize($r('app.float.text_caption'))
        .fontColor($r('app.color.text_hint'))
        .margin({ top: 8 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background'))
  }
}
