interface SceneModeItem {
  name: string;
  icon: Resource;
  hardwareId: number;
}

const SCENE_MODES: SceneModeItem[] = [
  { name: '明亮', icon: $r('app.media.home_icon_bright'), hardwareId: 103119 },
  { name: '柔和', icon: $r('app.media.home_icon_soft'), hardwareId: 103120 },
  { name: '阅读', icon: $r('app.media.home_icon_read'), hardwareId: 103121 },
  { name: '温馨', icon: $r('app.media.home_icon_warm'), hardwareId: 103122 }
];

@ComponentV2
export struct SceneModePanel {
  @Param currentMode: string = '';
  @Event onModeSelect: (hardwareId: number, modeName: string) => void = (_id: number, _name: string) => {};

  build() {
    Column() {
      Text('场景模式')
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: 12 })

      Grid() {
        ForEach(SCENE_MODES, (item: SceneModeItem, index: number) => {
          GridItem() {
            Column() {
              Image(item.icon)
                .width($r('app.float.icon_size_button'))
                .height($r('app.float.icon_size_button'))
                .fillColor(this.currentMode === item.name ?
                  $r('app.color.primary') :
                  $r('app.color.text_secondary'))
              Text(item.name)
                .fontSize($r('app.float.text_caption'))
                .fontColor(this.currentMode === item.name ?
                  $r('app.color.primary') :
                  $r('app.color.text_secondary'))
                .margin({ top: 4 })
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .borderRadius($r('app.float.radius_card'))
            .backgroundColor(this.currentMode === item.name ?
              'rgba(74, 144, 217, 0.1)' :
              Color.Transparent)
            .onClick(() => {
              this.onModeSelect(item.hardwareId, item.name);
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(12)
      .columnsGap(12)
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .borderRadius($r('app.float.radius_card'))
    .backgroundColor($r('app.color.surface'))
  }
}
