import { Light } from '../../../common/model/DeviceModels';

@ComponentV2
export struct IndependentLight {
  @Param lights: Light[] = [];
  @Event onToggle: (index: number) => void = (_index: number) => {};

  private getLightIcon(name: string): Resource {
    const map: Record<string, Resource> = {
      '廊灯': $r('app.media.light_icon_corrid_lights'),
      '洗漱间': $r('app.media.light_icon_washroom'),
      '衣柜灯': $r('app.media.light_icon_wardrobe'),
      '落地灯': $r('app.media.light_icon_right_left_desk_read'),
      '吧灯': $r('app.media.light_icon_bar_lamp'),
      '书桌灯': $r('app.media.light_icon_right_left_desk_read'),
      '左阅读灯': $r('app.media.light_icon_right_left_desk_read'),
      '右阅读灯': $r('app.media.light_icon_right_left_desk_read'),
      '排风扇': $r('app.media.light_icon_exhaust_fan')
    };
    return map[name] || $r('app.media.light_icon_corrid_lights');
  }

  build() {
    Column() {
      Text($r('app.string.light_independent_title'))
        .fontSize($r('app.float.text_body'))
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .margin({ bottom: $r('app.float.spacing_sm') })

      Stack() {
        Image($r('app.media.light_Independent_control_bg'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
          .borderRadius($r('app.float.radius_card'))

        Grid() {
          ForEach(this.lights, (light: Light, index: number) => {
            GridItem() {
              Row() {
                Row() {
                  Image(this.getLightIcon(light.name))
                    .width(20)
                    .height(20)
                    .fillColor(light.on ? $r('app.color.gold') : $r('app.color.text_secondary'))

                  Text(light.name)
                    .fontSize($r('app.float.text_caption'))
                    .fontColor(light.on ? $r('app.color.text_primary') : $r('app.color.text_secondary'))
                    .margin({ left: 6 })
                }

                Blank()

                  Image(light.on ? $r('app.media.light_toggle_on') : $r('app.media.light_toggle_off'))
                  .width(24)
                  .height(24)
                  .objectFit(ImageFit.Contain)
                  .onClick(() => {
                    this.onToggle(index);
                  })
              }
              .width('100%')
              .height(44)
              .padding({ left: $r('app.float.spacing_sm'), right: $r('app.float.spacing_sm') })
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(VerticalAlign.Center)
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsGap(8)
        .columnsGap($r('app.float.spacing_md'))
        .width('100%')
        .height(260)
        .padding($r('app.float.spacing_md'))
      }
      .width('100%')
      .height(260)
    }
    .width('100%')
  }
}
