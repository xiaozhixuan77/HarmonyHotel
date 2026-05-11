import { Light } from '../../../common/model/DeviceModels';

interface LightIconMap {
  name: string;
  icon: Resource;
}

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

        Column() {
          ForEach(this.lights, (light: Light, index: number) => {
            Row() {
              Row() {
                Image(this.getLightIcon(light.name))
                  .width($r('app.float.icon_size_tab'))
                  .height($r('app.float.icon_size_tab'))
                  .fillColor(light.on ? $r('app.color.gold') : $r('app.color.text_secondary'))

                Text(light.name)
                  .fontSize($r('app.float.text_body'))
                  .fontColor(light.on ? $r('app.color.text_primary') : $r('app.color.text_secondary'))
                  .margin({ left: $r('app.float.spacing_sm') })
              }

              Blank()

              Image(light.on ? $r('app.media.light_toggle_on') : $r('app.media.light_toggle_off'))
                .width(48)
                .height(28)
                .objectFit(ImageFit.Contain)
                .onClick(() => {
                  this.onToggle(index);
                })
            }
            .width('100%')
            .height(56)
            .padding({ left: $r('app.float.spacing_md'), right: $r('app.float.spacing_md') })
            .alignItems(VerticalAlign.Center)

            if (index < this.lights.length - 1) {
              Divider()
                .strokeWidth(1)
                .color($r('app.color.divider'))
                .margin({ left: $r('app.float.spacing_md'), right: $r('app.float.spacing_md') })
            }
          })
        }
        .width('100%')
        .padding({ top: $r('app.float.spacing_sm'), bottom: $r('app.float.spacing_sm') })
      }
      .width('100%')
    }
    .width('100%')
  }
}
