@ComponentV2
export struct ServiceStatus {
  @Param dndActive: boolean = false;
  @Param cleanRequested: boolean = false;
  @Event onDNDToggle: () => void = () => {};
  @Event onCleanToggle: () => void = () => {};
  @Event onGoodNight: () => void = () => {};

  build() {
    Column() {
      Text($r('app.string.page_service'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: $r('app.float.spacing_sm') })

      Row() {
        Column() {
          Image($r('app.media.home_icon_undisturb'))
            .width($r('app.float.icon_size_button'))
            .height($r('app.float.icon_size_button'))
            .fillColor(this.dndActive ? $r('app.color.gold') : $r('app.color.text_secondary'))
          Text($r('app.string.service_dnd'))
            .fontSize($r('app.float.text_caption'))
            .fontColor(this.dndActive ?
              $r('app.color.gold') :
              $r('app.color.text_secondary'))
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .onClick(() => {
          this.onDNDToggle();
        })

        Column() {
          Image($r('app.media.home_icon_clear'))
            .width($r('app.float.icon_size_button'))
            .height($r('app.float.icon_size_button'))
            .fillColor(this.cleanRequested ? $r('app.color.gold') : $r('app.color.text_secondary'))
          Text($r('app.string.service_clean'))
            .fontSize($r('app.float.text_caption'))
            .fontColor(this.cleanRequested ?
              $r('app.color.gold') :
              $r('app.color.text_secondary'))
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .onClick(() => {
          this.onCleanToggle();
        })

        Column() {
          Row() {
            Image($r('app.media.home_icon_night_left'))
              .width(20)
              .height(20)
              .fillColor($r('app.color.text_secondary'))
            Image($r('app.media.home_icon_night_right'))
              .width(20)
              .height(20)
              .fillColor($r('app.color.text_secondary'))
          }
          Text($r('app.string.light_sleep'))
            .fontSize($r('app.float.text_caption'))
            .fontColor($r('app.color.text_secondary'))
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .onClick(() => {
          this.onGoodNight();
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .padding($r('app.float.spacing_md'))
    .borderRadius($r('app.float.radius_card'))
    .backgroundColor($r('app.color.surface'))
    .backdropBlur(10)
  }
}
