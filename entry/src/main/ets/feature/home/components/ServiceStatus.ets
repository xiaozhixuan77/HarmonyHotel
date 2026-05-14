@ComponentV2
export struct ServiceStatus {
  @Param dndActive: boolean = false;
  @Param cleanRequested: boolean = false;
  @Event onDNDToggle: () => void = () => {};
  @Event onCleanToggle: () => void = () => {};
  @Event onGoodNight: () => void = () => {};

  build() {
    Column() {
      Text($r('app.string.home_quick_service'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: $r('app.float.spacing_sm') })

      Row() {
        Stack() {
          Image($r('app.media.home_layer_night'))
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Fill)
            .borderRadius($r('app.float.radius_card'))
          Row() {
            Image($r('app.media.home_icon_undisturb'))
              .width($r('app.float.icon_size_button'))
              .height($r('app.float.icon_size_button'))
              .fillColor(this.dndActive ? $r('app.color.gold') : Color.Black)
            Text($r('app.string.service_dnd'))
              .fontSize($r('app.float.text_caption'))
              .fontColor(this.dndActive ? $r('app.color.gold') : Color.Black)
              .margin({ left: 8 })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
        }
        .width('48%')
        .height(64)
        .borderRadius($r('app.float.radius_card'))
        .backgroundColor(this.dndActive ? 'rgba(212, 177, 106, 0.35)' : 'rgba(255, 255, 255, 0.08)')
        .onClick(() => {
          this.onDNDToggle();
        })

        Stack() {
          Image($r('app.media.home_layer_night'))
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Fill)
            .borderRadius($r('app.float.radius_card'))
          Row() {
            Image($r('app.media.home_icon_clear'))
              .width($r('app.float.icon_size_button'))
              .height($r('app.float.icon_size_button'))
              .fillColor(this.cleanRequested ? $r('app.color.gold') : Color.Black)
            Text($r('app.string.service_clean'))
              .fontSize($r('app.float.text_caption'))
              .fontColor(this.cleanRequested ? $r('app.color.gold') : Color.Black)
              .margin({ left: 8 })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
        }
        .width('48%')
        .height(64)
        .borderRadius($r('app.float.radius_card'))
        .backgroundColor(this.cleanRequested ? 'rgba(212, 177, 106, 0.35)' : 'rgba(255, 255, 255, 0.08)')
        .onClick(() => {
          this.onCleanToggle();
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: $r('app.float.spacing_md') })

      Stack() {
        Image($r('app.media.home_layer_night'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
          .borderRadius($r('app.float.radius_card'))

        Row() {
          Image($r('app.media.home_icon_night_left'))
            .width(32)
            .height(32)

          Column() {
            Text($r('app.string.home_good_night'))
              .fontSize($r('app.float.text_body'))
              .fontColor(Color.Black)
              .fontWeight(FontWeight.Medium)
            Text($r('app.string.home_good_night_desc'))
              .fontSize($r('app.float.text_caption'))
              .fontColor(Color.Black)
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
          .margin({ left: 12, right: 12 })

          Image($r('app.media.home_icon_night_right'))
            .width(30)
            .height(30)
        }
        .width('100%')
        .height('100%')
        .alignItems(VerticalAlign.Center)
        .padding({ left: '30vp', right: '25vp' })
      }
      .width('100%')
      .height(64)
      .borderRadius($r('app.float.radius_card'))
      .clip(true)
      .onClick(() => {
        this.onGoodNight();
      })
    }
    .width('100%')
    .padding($r('app.float.spacing_md'))
    .borderRadius($r('app.float.radius_card'))
  }
}
