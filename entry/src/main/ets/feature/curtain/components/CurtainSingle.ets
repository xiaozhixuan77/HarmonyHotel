import { CurtainState } from '../../../common/model/DeviceModels';

@ComponentV2
export struct CurtainSingle {
  @Param state: CurtainState = 'close';
  @Event onStateChange: (state: CurtainState) => void = (_state: CurtainState) => {};

  private getLeftIcon(state: CurtainState): Resource {
    if (state === 'open') {
      return $r('app.media.curtain_icon_left_part');
    } else if (state === 'close') {
      return $r('app.media.curtain_icon_left_closed');
    } else {
      return $r('app.media.curtain_icon_left_part');
    }
  }

  private getRightIcon(state: CurtainState): Resource {
    if (state === 'open') {
      return $r('app.media.curtain_icon_right_part');
    } else if (state === 'close') {
      return $r('app.media.curtain_icon_right_closed');
    } else {
      return $r('app.media.curtain_icon_right_part');
    }
  }

  private getBtnBg(isSelected: boolean): Resource {
    return isSelected ? $r('app.media.curtain_btn_selected_bg') : $r('app.media.curtain_btn_unselected_bg');
  }

  build() {
    Stack() {
      Image($r('app.media.curtain_curtain_section_part_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.radius_card'))

      Column() {
        Text($r('app.string.curtain_cloth_title'))
          .fontSize($r('app.float.text_body'))
          .fontColor($r('app.color.text_primary'))
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .margin({ top: 12, bottom: 8 })

        Row() {
          Image(this.getLeftIcon(this.state))
            .width(100)
            .height(100)
            .objectFit(ImageFit.Contain)

          Image(this.getRightIcon(this.state))
            .width(100)
            .height(100)
            .objectFit(ImageFit.Contain)
        }
        .width('100%')
        .height(110)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)

        Row() {
          this.CurtainBtn('open', this.state === 'open', () => {
            this.onStateChange('open');
          })
          this.CurtainBtn('pause', this.state === 'pause', () => {
            this.onStateChange('pause');
          })
          this.CurtainBtn('close', this.state === 'close', () => {
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
  CurtainBtn(action: string, isSelected: boolean, onClick: () => void) {
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
