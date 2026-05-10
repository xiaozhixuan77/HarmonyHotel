@ComponentV2
export struct AirconControl {
  @Param settingTemp: number = 22;
  @Param currentTemp: number = 19;
  @Param isOn: boolean = true;
  @Param isLoading: boolean = false;
  @Event onTempUp: () => void = () => {};
  @Event onTempDown: () => void = () => {};
  @Event onPowerToggle: () => void = () => {};

  build() {
    Column() {
      Row() {
        Text($r('app.string.home_temp_current'))
          .fontSize($r('app.float.text_caption'))
          .fontColor($r('app.color.text_secondary'))
        Text(this.currentTemp + '°C')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 8 })
      }
      .width('100%')
      .margin({ bottom: 16 })

      Row() {
        Column() {
          Text($r('app.string.home_temp_setting'))
            .fontSize($r('app.float.text_caption'))
            .fontColor($r('app.color.text_secondary'))
          Text(this.settingTemp + '°C')
            .fontSize($r('app.float.text_title'))
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary'))
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)

        Blank()

        Image(this.isOn ? $r('app.media.home_icon_airconditioner') : $r('app.media.home_icon_close'))
          .width(48)
          .height(48)
          .opacity(this.isOn ? 1.0 : 0.4)
          .onClick(() => {
            this.onPowerToggle();
          })
      }
      .width('100%')
      .margin({ bottom: 16 })

      Row() {
        Image($r('app.media.home_btn_sub'))
          .width($r('app.float.icon_size_button'))
          .height($r('app.float.icon_size_button'))
          .enabled(!this.isLoading && this.settingTemp > 16)
          .opacity(this.settingTemp <= 16 ? 0.4 : 1.0)
          .onClick(() => {
            this.onTempDown();
          })

        Text(this.settingTemp + '°C')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 20, right: 20 })

        Image($r('app.media.home_btn_add'))
          .width($r('app.float.icon_size_button'))
          .height($r('app.float.icon_size_button'))
          .enabled(!this.isLoading && this.settingTemp < 30)
          .opacity(this.settingTemp >= 30 ? 0.4 : 1.0)
          .onClick(() => {
            this.onTempUp();
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')

      if (this.isLoading) {
        LoadingProgress()
          .width(24)
          .height(24)
          .margin({ top: 8 })
          .color($r('app.color.primary'))
      }
    }
    .width('100%')
    .padding(16)
    .borderRadius($r('app.float.radius_card'))
    .backgroundColor($r('app.color.surface'))
  }
}
