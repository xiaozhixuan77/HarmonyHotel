@ComponentV2
export struct ServicePage {
  build() {
    Column() {
      Text('客房服务')
        .fontSize($r('app.float.text_title'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
      Text('待步骤八实现完整服务模块')
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
