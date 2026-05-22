@ComponentV2
export struct LightMainSwitch {
  @Param isOn: boolean = false;
  @Event onToggle: () => void = () => {};

  build() {
    Column() {
      Image($r('app.media.light_btn_main_switch'))
        .width(120)
        .height(120)
        .objectFit(ImageFit.Contain)
        .fillColor(this.isOn ? $r('app.color.gold') : $r('app.color.text_secondary'))

      Text($r('app.string.light_main_switch_label'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .margin({ top: 8 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.onToggle();
    })
  }
}
