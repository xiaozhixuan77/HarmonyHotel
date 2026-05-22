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
    }
    .width('100%')
    .height(120)
    .onClick(() => {
      this.onConfirm();
    })
  }
}
