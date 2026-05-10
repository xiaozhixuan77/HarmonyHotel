@ComponentV2
export struct CurtainPage {
  build() {
    Column() {
      Text('窗帘控制')
        .fontSize($r('app.float.text_title'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
      Text('待步骤七实现完整窗帘模块')
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
