import { LightViewModel } from '../ViewModel/LightViewModel';
import { LightMainSwitch } from './components/LightMainSwitch';
import { LightSceneMode } from './components/LightSceneMode';
import { IndependentLight } from './components/IndependentLight';

@ComponentV2
export struct LightPage {
  @Local viewModel: LightViewModel = new LightViewModel();

  async aboutToAppear(): Promise<void> {
    await this.viewModel.loadLights();
  }

  build() {
    Stack() {
      Image($r('app.media.light_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Scroll() {
        Column() {
          Text($r('app.string.page_light'))
            .fontSize($r('app.float.text_title'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .width('100%')
            .margin({ top: 24, bottom: 20 })

          LightMainSwitch({
            isOn: this.viewModel.mainSwitchOn,
            onToggle: (): void => {
              this.viewModel.setAllLights(!this.viewModel.mainSwitchOn);
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          LightSceneMode({
            currentMode: this.viewModel.currentSceneMode,
            modes: this.viewModel.lightModes,
            onModeSelect: (hardwareId: number, modeName: string): void => {
              this.viewModel.setSceneMode(hardwareId, modeName);
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          IndependentLight({
            lights: this.viewModel.lights,
            onToggle: (index: number): void => {
              this.viewModel.toggleLight(index);
            }
          })
        }
        .width('100%')
        .padding({ left: $r('app.float.spacing_lg'), right: $r('app.float.spacing_lg'), bottom: 24 ,top: 24})
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
