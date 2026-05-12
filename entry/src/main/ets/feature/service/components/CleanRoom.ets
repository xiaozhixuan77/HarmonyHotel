@ComponentV2
export struct CleanRoom {
  @Param isRequested: boolean = false;
  @Event onClick: () => void = () => {};

  build() {
    Stack() {
      Image($r('app.media.service_clean_room_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Row() {
        Row() {
          Image($r('app.media.service_icon_clean_room'))
            .width($r('app.float.icon_size_button'))
            .height($r('app.float.icon_size_button'))

          Text($r('app.string.service_clean'))
            .fontSize($r('app.float.text_body'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Medium)
            .margin({ left: $r('app.float.spacing_sm') })
        }
        .layoutWeight(1)

        Text(this.isRequested ? '已通知' : '点击请求')
          .fontSize($r('app.float.text_caption'))
          .fontColor(this.isRequested ? $r('app.color.gold') : $r('app.color.text_hint'))
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
      this.onClick();
    })
  }
}
