import { CurtainState } from '../../../common/model/DeviceModels';

type Side = 'left' | 'right';

@ComponentV2
export struct WindowScreening {
  @Param leftState: CurtainState = 'close';
  @Param rightState: CurtainState = 'close';
  @Event onStateChange: (side: Side, state: CurtainState) => void = (_side: Side, _state: CurtainState) => {};

  private getLeftIcon(state: CurtainState): Resource {
    if (state === 'open') {
      return $r('app.media.curtain_icon_window_screening_left_part');
    } else if (state === 'close') {
      return $r('app.media.curtain_icon_window_screening_left_part_closed');
    } else {
      return $r('app.media.curtain_icon_window_screening_left_part');
    }
  }

  private getRightIcon(state: CurtainState): Resource {
    if (state === 'open') {
      return $r('app.media.curtain_icon_window_screening_right_part');
    } else if (state === 'close') {
      return $r('app.media.curtain_icon_window_screening_right_part_closed');
    } else {
      return $r('app.media.curtain_icon_window_screening_right_part');
    }
  }

  private getBtnBg(isSelected: boolean): Resource {
    return isSelected ? $r('app.media.curtain_btn_selected_bg') : $r('app.media.curtain_btn_unselected_bg');
  }

  build() {
    Stack() {
      Image($r('app.media.curtain_window_screening_part_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Column() {
        Image($r('app.media.curtain_icon_top_bar'))
          .width('60%')
          .height(4)
          .objectFit(ImageFit.Fill)
          .margin({ top: 8 })

        Text($r('app.string.curtain_screen_title'))
          .fontSize($r('app.float.text_body'))
          .fontColor($r('app.color.text_primary'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 4, bottom: 8 })

        Row() {
          Column() {
            Image(this.getLeftIcon(this.leftState))
              .width(80)
              .height(80)
              .objectFit(ImageFit.Contain)

            Text($r('app.string.curtain_left'))
              .fontSize($r('app.float.text_caption'))
              .fontColor($r('app.color.text_secondary'))
              .margin({ top: 4 })
          }
          .width('50%')
          .alignItems(HorizontalAlign.Center)

          Column() {
            Image(this.getRightIcon(this.rightState))
              .width(80)
              .height(80)
              .objectFit(ImageFit.Contain)

            Text($r('app.string.curtain_right'))
              .fontSize($r('app.float.text_caption'))
              .fontColor($r('app.color.text_secondary'))
              .margin({ top: 4 })
          }
          .width('50%')
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .height(120)

        Row() {
          this.ScreenBtn('open', this.leftState === 'open', () => {
            this.onStateChange('left', 'open');
          })
          this.ScreenBtn('close', this.leftState === 'close', () => {
            this.onStateChange('left', 'close');
          })
          this.ScreenBtn('half', this.leftState === 'half', () => {
            this.onStateChange('left', 'half');
          })
        }
        .width('100%')
        .height(44)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 8 })

        Row() {
          this.ScreenBtn('open', this.rightState === 'open', () => {
            this.onStateChange('right', 'open');
          })
          this.ScreenBtn('close', this.rightState === 'close', () => {
            this.onStateChange('right', 'close');
          })
          this.ScreenBtn('half', this.rightState === 'half', () => {
            this.onStateChange('right', 'half');
          })
        }
        .width('100%')
        .height(44)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 8 })
      }
      .width('100%')
      .height('100%')
      .padding($r('app.float.spacing_md'))
    }
    .width('100%')
    .height(300)
  }

  @Builder
  ScreenBtn(action: string, isSelected: boolean, onClick: () => void) {
    Stack() {
      Image(this.getBtnBg(isSelected))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_button'))

      Row() {
        if (action === 'open') {
          Image($r('app.media.curtain_icon_open'))
            .width(16)
            .height(16)
            .objectFit(ImageFit.Contain)
            .margin({ right: 4 })
        } else if (action === 'close') {
          Image($r('app.media.curtain_icon_close'))
            .width(16)
            .height(16)
            .objectFit(ImageFit.Contain)
            .margin({ right: 4 })
        }

        Text(this.getActionLabel(action))
          .fontSize(14)
          .fontColor(isSelected ? $r('app.color.gold') : $r('app.color.text_primary'))
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
    }
    .width('31%')
    .height('100%')
    .onClick(onClick)
  }

  private getActionLabel(action: string): ResourceStr {
    if (action === 'open') {
      return $r('app.string.curtain_open');
    } else if (action === 'close') {
      return $r('app.string.curtain_close');
    } else if (action === 'half') {
      return $r('app.string.curtain_half');
    }
    return '';
  }
}
