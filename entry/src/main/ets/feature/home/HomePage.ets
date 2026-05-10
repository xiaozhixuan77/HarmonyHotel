@ComponentV2
export struct HomePage {
  build() {
    Column() {
      Text($r('app.string.home_title'))
        .fontSize($r('app.float.text_title'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
      Text('待步骤五实现完整首页')
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
