@ComponentV2
export struct CurtainAllControl {
  @Event onOpenAll: () => void = () => {};
  @Event onCloseAll: () => void = () => {};

  build() {
    Stack() {
      Image($r('app.media.curtain_all_open_close_part_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Row() {
        Row() {
          Image($r('app.media.curtain_icon_open_all'))
            .width(24)
            .height(24)
            .objectFit(ImageFit.Contain)
            .margin({right: 8})

          Text($r('app.string.curtain_all_open_label'))
            .fontSize($r('app.float.text_caption'))
            .fontColor($r('app.color.text_primary'))
            .margin({ top: 8 })
        }
        .width('48%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .backgroundImage($r('app.media.curtain_btn_all_open_or_close_selected_bg'))
        .backgroundImageSize(ImageSize.Contain)
        .backgroundImagePosition(Alignment.Center)
        .borderRadius($r('app.float.radius_button'))
        .onClick(() => {
          this.onOpenAll();
        })

        Blank()

        Row() {
          Image($r('app.media.curtain_icon_close_all'))
            .width(24)
            .height(24)
            .objectFit(ImageFit.Contain)
            .margin({ right: 8})

          Text($r('app.string.curtain_all_close_label'))
            .fontSize($r('app.float.text_caption'))
            .fontColor($r('app.color.text_primary'))
            .margin({ top: 8 })
        }
        .width('48%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .backgroundImage($r('app.media.curtain_btn_all_open_or_close_selected_bg'))
        .backgroundImageSize(ImageSize.Contain)
        .backgroundImagePosition(Alignment.Center)
        .borderRadius($r('app.float.radius_button'))
        .onClick(() => {
          this.onCloseAll();
        })
      }
      .width('100%')
      .height('100%')
      .padding($r('app.float.spacing_md'))
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height(80)
  }
}
