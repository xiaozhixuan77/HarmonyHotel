interface SceneModeItem {
  label: ResourceStr;
  key: string;
  icon: Resource;
  hardwareId: number;
}

@ComponentV2
export struct SceneModePanel {
  @Param currentMode: string = '';
  @Event onModeSelect: (hardwareId: number, modeName: string) => void = (_id: number, _name: string) => {};

  private modes: SceneModeItem[] = [
    { label: $r('app.string.light_bright'), key: '明亮', icon: $r('app.media.home_icon_bright'), hardwareId: 103119 },
    { label: $r('app.string.light_soft'), key: '柔和', icon: $r('app.media.home_icon_soft'), hardwareId: 103120 },
    { label: $r('app.string.light_read'), key: '阅读', icon: $r('app.media.home_icon_read'), hardwareId: 103121 },
    { label: $r('app.string.light_warm'), key: '温馨', icon: $r('app.media.home_icon_warm'), hardwareId: 103122 }
  ];

  build() {
    Column() {
      Text($r('app.string.home_scene_mode'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: $r('app.float.spacing_sm') })

      Grid() {
        ForEach(this.modes, (item: SceneModeItem, index: number) => {
          GridItem() {
            Stack() {
              Image($r('app.media.home_layer_scenemode'))
                .width('100%')
                .height('100%')
                .objectFit(ImageFit.Fill)
                .borderRadius($r('app.float.radius_card'))

              Row() {
                Image(item.icon)
                  .width($r('app.float.icon_size_button'))
                  .height($r('app.float.icon_size_button'))
                  .fillColor(this.currentMode === item.key ? $r('app.color.gold') : Color.Black)
                Text(item.label)
                  .fontSize($r('app.float.text_caption'))
                  .fontColor(this.currentMode === item.key ? $r('app.color.gold') : Color.Black)
                  .margin({ left: 8 })
              }
              .width('100%')
              .height('100%')
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)
              .backgroundColor(this.currentMode === item.key ? 'rgba(212, 177, 106, 0.35)' : Color.Transparent)
            }
            .width('100%')
            .height('100%')
            .borderRadius($r('app.float.radius_card'))
            .clip(true)
            .onClick(() => {
              this.onModeSelect(item.hardwareId, item.key);
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .rowsGap($r('app.float.spacing_md'))
      .columnsGap($r('app.float.spacing_md'))
      .width('100%')
      .height(160)
    }
    .width('100%')
    .padding($r('app.float.spacing_md'))
    .borderRadius($r('app.float.radius_card'))
  }
}
