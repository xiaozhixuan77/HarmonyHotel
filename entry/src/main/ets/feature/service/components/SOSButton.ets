@ComponentV2
export struct SOSButton {
  @Event onConfirm: () => void = () => {};

  build() {
    Stack() {
      Image($r('app.media.service_btn_sos_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Row() {
        Text('SOS')
          .fontSize(28)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height(80)
    .onClick(() => {
      this.onConfirm();
    })
  }
}
