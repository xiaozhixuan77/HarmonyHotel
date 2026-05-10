import { rpc } from "@kit.IPCKit";

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
    Stack() {
      Image($r('app.media.home_layer_airconditioner'))
        .objectFit(ImageFit.Fill)

      Column() {
        Row() {
          Row() {
            Image($r('app.media.home_icon_airconditioner'))
              .width(40)
              .height(40)
            Column() {
              Text($r('app.string.home_ac_label'))
                .fontSize($r('app.float.text_body'))
                .fontColor($r('app.color.text_primary'))
                .fontWeight(FontWeight.Medium)
              if (this.isOn) {
                Text($r('app.string.home_ac_running'))
                  .fontSize($r('app.float.text_caption'))
                  .fontColor('#50C878')
              }
            }
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 8 })
            Text($r('app.string.home_temp_current'))
              .fontSize($r('app.float.text_caption'))
              .fontColor($r('app.color.text_secondary'))
              .margin({left:8})
            Text(this.currentTemp + '°C')
              .fontSize($r('app.float.text_body'))
              .fontColor($r('app.color.text_primary'))
              .margin({ top: 4, bottom: 4 })
          }

          Blank()

          Image($r('app.media.home_icon_close'))
            .width(40)
            .height(40)
            .opacity(this.isOn ? 0.5 : 1.0)
            .onClick(() => {
              this.onPowerToggle();
            })
        }
        .width('100%')
        .margin({ bottom: $r('app.float.spacing_md') })

        Row() {
          Column() {

            Image($r('app.media.home_btn_sub'))
              .width($r('app.float.icon_size_button'))
              .height($r('app.float.icon_size_button'))
              .enabled(!this.isLoading && this.settingTemp > 16)
              .opacity(this.settingTemp <= 16 ? 0.4 : 1.0)
              .onClick(() => {
                this.onTempDown();
              })
          }
          .alignItems(HorizontalAlign.Center)
          .layoutWeight(1)

          Column() {
            Text($r('app.string.home_temp_setting'))
              .fontSize($r('app.float.text_caption'))
              .fontColor($r('app.color.text_secondary'))
            Text(this.settingTemp + '°C')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Center)
          .layoutWeight(1)

          Column() {
            Image($r('app.media.home_btn_add'))
              .width($r('app.float.icon_size_button'))
              .height($r('app.float.icon_size_button'))
              .enabled(!this.isLoading && this.settingTemp < 30)
              .opacity(this.settingTemp >= 30 ? 0.4 : 1.0)
              .onClick(() => {
                this.onTempUp();
              })
          }
          .alignItems(HorizontalAlign.Center)
          .layoutWeight(1)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)

        if (this.isLoading) {
          LoadingProgress()
            .width(24)
            .height(24)
            .margin({ top: 8 })
            .color($r('app.color.gold'))
        }
      }
      .width('100%')
      .padding($r('app.float.spacing_md'))
    }
    .width('100%')
    .height('150vp')
    .borderRadius($r('app.float.radius_card'))
    .clip(true)
  }
}
