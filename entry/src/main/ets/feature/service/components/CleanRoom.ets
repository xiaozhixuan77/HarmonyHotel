@ComponentV2
export struct CleanRoom {
  @Param isOn: boolean = false;
  @Event onToggle: () => void = () => {};

  build() {
    Stack() {
      Image($r('app.media.service_clean_room_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Column() {
        Image($r('app.media.service_icon_clean_room'))
          .width(40)
          .height(40)

        Text($r('app.string.service_clean'))
          .fontSize($r('app.float.text_caption'))
          .fontColor($r('app.color.text_primary'))
          .margin({ top: 8 })

        Stack({ alignContent: Alignment.Start }) {
          Image($r('app.media.service_toggle_bg'))
            .width(56)
            .height(32)
            .objectFit(ImageFit.Fill)

          Image($r('app.media.service_toggle_dots_bg'))
            .width(28)
            .height(28)
            .position({
              x: this.isOn ? 26 : 2,
              y: 2
            })
            .animation({
              duration: 200,
              curve: Curve.EaseInOut
            })
        }
        .width(56)
        .height(32)
        .margin({ top: 8 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height(140)
    .onClick(() => {
      this.onToggle();
    })
  }
}
