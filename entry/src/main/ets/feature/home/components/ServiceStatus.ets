@ComponentV2
export struct ServiceStatus {
  @Param dndActive: boolean = false;
  @Param cleanRequested: boolean = false;
  @Event onDNDToggle: () => void = () => {};
  @Event onCleanToggle: () => void = () => {};
  @Event onGoodNight: () => void = () => {};

  build() {
    Column() {
      Text('客房服务')
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: 12 })

      Row() {
        Column() {
          Image($r('app.media.home_icon_undisturb'))
            .width($r('app.float.icon_size_button'))
            .height($r('app.float.icon_size_button'))
            .opacity(this.dndActive ? 1.0 : 0.4)
          Text($r('app.string.service_dnd'))
            .fontSize($r('app.float.text_caption'))
            .fontColor(this.dndActive ?
              $r('app.color.primary') :
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
            .opacity(this.cleanRequested ? 1.0 : 0.4)
          Text($r('app.string.service_clean'))
            .fontSize($r('app.float.text_caption'))
            .fontColor(this.cleanRequested ?
              $r('app.color.primary') :
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
            Image($r('app.media.home_icon_night_right'))
              .width(20)
              .height(20)
          }
          Text('晚安模式')
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
    .padding(16)
    .borderRadius($r('app.float.radius_card'))
    .backgroundColor($r('app.color.surface'))
  }
}
