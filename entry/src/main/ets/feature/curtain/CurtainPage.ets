import { CurtainViewModel } from './CurtainViewModel';
import { CurtainAllControl } from './components/CurtainAllControl';
import { CurtainSingle } from './components/CurtainSingle';
import { WindowScreening } from './components/WindowScreening';
import { CurtainState } from '../../common/model/DeviceModels';

@ComponentV2
export struct CurtainPage {
  @Local viewModel: CurtainViewModel = new CurtainViewModel();

  async aboutToAppear(): Promise<void> {
    await this.viewModel.loadCurtains();
  }

  private getCurtainState(index: number): CurtainState {
    if (index < 0 || index >= this.viewModel.curtains.length) {
      return 'close';
    }
    return this.viewModel.curtains[index].state || 'close';
  }

  build() {
    Stack() {
      Image($r('app.media.curtain_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Scroll() {
        Column() {
          Text($r('app.string.page_curtain'))
            .fontSize($r('app.float.text_title'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .margin({ top: 24, bottom: 20 })

          CurtainAllControl({
            onOpenAll: (): void => {
              this.viewModel.setAll('open');
            },
            onCloseAll: (): void => {
              this.viewModel.setAll('close');
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          CurtainSingle({
            leftState: this.getCurtainState(0),
            rightState: this.getCurtainState(0),
            onStateChange: (side: 'left' | 'right', state: CurtainState): void => {
              this.viewModel.setCurtainState(0, state);
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          WindowScreening({
            leftState: this.getCurtainState(1),
            rightState: this.getCurtainState(1),
            onStateChange: (side: 'left' | 'right', state: CurtainState): void => {
              this.viewModel.setCurtainState(1, state);
            }
          })
        }
        .width('100%')
        .padding({ left: $r('app.float.spacing_lg'), right: $r('app.float.spacing_lg'), bottom: 24 })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
  }
}
