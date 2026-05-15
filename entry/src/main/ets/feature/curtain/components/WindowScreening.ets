import { CurtainState } from '../../../common/model/DeviceModels';

@ComponentV2
export struct WindowScreening {
  @Param state: CurtainState = 'close';
  @Event onStateChange: (state: CurtainState) => void = (_state: CurtainState) => {};

  private getLeftOffset(): number {
    if (this.state === 'open') {
      return -100;
    } else if (this.state === 'pause' || this.state === 'half') {
      return -30;
    }
    return 0;
  }

  private getRightOffset(): number {
    if (this.state === 'open') {
      return 100;
    } else if (this.state === 'pause' || this.state === 'half') {
      return 30;
    }
    return 0;
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
        Text($r('app.string.curtain_screen_title'))
          .fontSize($r('app.float.text_body'))
          .fontColor($r('app.color.text_primary'))
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .margin({ top: 12, bottom: 8 })
        Image($r('app.media.curtain_icon_top_bar'))
          .width(170)
          .height(5)

        Row() {
          Stack() {
            Image($r('app.media.curtain_icon_window_screening_left_part_closed'))
              .width(100)
              .height(100)
              .objectFit(ImageFit.Contain)
              .translate({ x: this.getLeftOffset() })
              .animation({ duration: 500, curve: Curve.EaseInOut })
          }
          .width(90)
          .height(100)
          .clip(true)

          Stack() {
            Image($r('app.media.curtain_icon_window_screening_right_part_closed'))
              .width(100)
              .height(100)
              .objectFit(ImageFit.Contain)
              .translate({ x: this.getRightOffset() })
              .animation({ duration: 500, curve: Curve.EaseInOut })
          }
          .width(90)
          .height(100)
          .clip(true)
        }
        .width('100%')
        .height(110)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)

        Row() {
          this.ScreenBtn('open', this.state === 'open', () => {
            this.onStateChange('open');
          })
          this.ScreenBtn('pause', this.state === 'pause', () => {
            this.onStateChange('pause');
          })
          this.ScreenBtn('close', this.state === 'close', () => {
            this.onStateChange('close');
          })
        }
        .width('100%')
        .height(80)
        .justifyContent(FlexAlign.SpaceAround)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 4, bottom: 8 })
      }
      .width('100%')
      .height('100%')
      .padding({ left: $r('app.float.spacing_md'), right: $r('app.float.spacing_md') })
    }
    .width('100%')
    .height(260)
  }

  @Builder
  ScreenBtn(action: string, isSelected: boolean, onClick: () => void) {
    Column() {
      Stack() {
        Image(this.getBtnBg(isSelected))
          .width(48)
          .height(48)
          .objectFit(ImageFit.Fill)
          .borderRadius(24)

        Image(this.getActionIcon(action))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Contain)
          .fillColor(isSelected ? $r('app.color.gold') : $r('app.color.text_primary'))
      }
      .width(48)
      .height(48)

      Text(this.getActionLabel(action))
        .fontSize(12)
        .fontColor(isSelected ? $r('app.color.gold') : $r('app.color.text_secondary'))
        .margin({ top: 4 })
    }
    .width('33%')
    .alignItems(HorizontalAlign.Center)
    .onClick(onClick)
  }

  private getActionIcon(action: string): Resource {
    if (action === 'open') {
      return $r('app.media.curtain_icon_open');
    } else if (action === 'pause') {
      return $r('app.media.curtain_icon_pause');
    } else if (action === 'close') {
      return $r('app.media.curtain_icon_close');
    }
    return $r('app.media.curtain_icon_open');
  }

  private getActionLabel(action: string): ResourceStr {
    if (action === 'open') {
      return $r('app.string.curtain_open');
    } else if (action === 'pause') {
      return $r('app.string.curtain_pause');
    } else if (action === 'close') {
      return $r('app.string.curtain_close');
    }
    return '';
  }
}
