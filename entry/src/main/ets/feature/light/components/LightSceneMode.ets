import { LightMode } from '../../../common/model/DeviceModels';

interface SceneItem {
  label: ResourceStr;
  key: string;
  icon: Resource;
  hardwareId: number;
}

@ComponentV2
export struct LightSceneMode {
  @Param currentMode: string = '';
  @Param modes: LightMode[] = [];
  @Event onModeSelect: (hardwareId: number, modeName: string) => void = (_id: number, _name: string) => {};

  private getSceneItems(): SceneItem[] {
    const iconMap: Record<string, Resource> = {
      '明亮模式': $r('app.media.light_icon_bright_mode'),
      '柔和模式': $r('app.media.light_icon_soft'),
      '阅读模式': $r('app.media.light_icon_read_mode'),
      '温馨模式': $r('app.media.light_icon_warm_mode'),
      '睡眠模式': $r('app.media.light_icon_sleep_mode')
    };
    return this.modes.map((m: LightMode): SceneItem => {
      return {
        label: m.name,
        key: m.name,
        icon: iconMap[m.name] || $r('app.media.light_icon_bright_mode'),
        hardwareId: m.id
      };
    });
  }

  build() {
    Column() {
      Text($r('app.string.light_scene_mode_title'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: $r('app.float.spacing_sm') })

      Stack() {
        Image($r('app.media.light_scene_mode_bg'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
          .borderRadius($r('app.float.radius_card'))

        Grid() {
          ForEach(this.getSceneItems(), (item: SceneItem, index: number) => {
            GridItem() {
              Stack() {
                Image($r('app.media.light_btn_mode_bg'))
                  .width('100%')
                  .height('100%')
                  .objectFit(ImageFit.Fill)
                  .borderRadius($r('app.float.radius_card'))

                Column() {
                  Image(item.icon)
                    .width($r('app.float.icon_size_button'))
                    .height($r('app.float.icon_size_button'))
                    .fillColor(this.currentMode === item.key ? $r('app.color.gold') : Color.Black)
                  Text(item.label)
                    .fontSize($r('app.float.text_caption'))
                    .fontColor(this.currentMode === item.key ? $r('app.color.gold') : Color.Black)
                    .margin({ top: 4 })
                }
                .width('100%')
                .height('100%')
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
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
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .rowsGap($r('app.float.spacing_md'))
        .columnsGap($r('app.float.spacing_md'))
        .width('100%')
        .height(200)
        .padding($r('app.float.spacing_md'))
      }
      .width('100%')
      .height(200)
    }
    .width('100%')
  }
}
