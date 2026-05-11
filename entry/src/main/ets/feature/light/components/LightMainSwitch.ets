@ComponentV2
export struct LightMainSwitch {
  @Param isOn: boolean = false;
  @Event onToggle: () => void = () => {};

  build() {
    Column() {
      Row() {
        Image($r('app.media.light_btn_main_switch'))
          .width(48)
          .height(48)
          .objectFit(ImageFit.Contain)
          .fillColor(this.isOn ? $r('app.color.gold') : $r('app.color.text_secondary'))

        Column() {
          Text(this.isOn ? $r('app.string.light_main_switch_off') : $r('app.string.light_main_switch_on'))
            .fontSize($r('app.float.text_body'))
            .fontColor(this.isOn ? $r('app.color.gold') : $r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)

          Text(this.isOn ? $r('app.string.light_main_switch_status_on') : $r('app.string.light_main_switch_status_off'))
            .fontSize($r('app.float.text_caption'))
            .fontColor($r('app.color.text_secondary'))
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: $r('app.float.spacing_md') })

        Blank()
      }
      .width('100%')
      .height(80)
      .padding($r('app.float.spacing_md'))
      .backgroundColor($r('app.color.card_bg'))
      .borderRadius($r('app.float.radius_card'))
      .alignItems(VerticalAlign.Center)
      .onClick(() => {
        this.onToggle();
      })
    }
    .width('100%')
  }
}
