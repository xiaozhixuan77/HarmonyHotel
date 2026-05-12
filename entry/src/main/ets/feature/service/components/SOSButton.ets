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

      Text($r('app.string.service_sos'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height(72)
    .onClick(() => {
      this.onConfirm();
    })
  }
}
