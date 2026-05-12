@ComponentV2
export struct DNDToggle {
  @Param isOn: boolean = false;
  @Event onToggle: () => void = () => {};

  build() {
    Stack() {
      Image($r('app.media.service_do_not_disturb_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Row() {
        Row() {
          Image($r('app.media.service_icon_do_not_disturb'))
            .width($r('app.float.icon_size_button'))
            .height($r('app.float.icon_size_button'))

          Text($r('app.string.service_dnd'))
            .fontSize($r('app.float.text_body'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Medium)
            .margin({ left: $r('app.float.spacing_sm') })
        }
        .layoutWeight(1)

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
      }
      .width('100%')
      .height('100%')
      .padding({ left: $r('app.float.spacing_md'), right: $r('app.float.spacing_md') })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height(72)
    .onClick(() => {
      this.onToggle();
    })
  }
}
