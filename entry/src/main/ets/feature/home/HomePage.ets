import { HomeViewModel } from './HomeViewModel';
import { AirconControl } from './components/AirconControl';
import { SceneModePanel } from './components/SceneModePanel';
import { ServiceStatus } from './components/ServiceStatus';

@ComponentV2
export struct HomePage {
  @Local viewModel: HomeViewModel = new HomeViewModel();

  async aboutToAppear(): Promise<void> {
    await this.viewModel.loadRoomState();
  }

  build() {
    Stack() {
      Image($r('app.media.home_background'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Scroll() {
        Column() {
          Column() {
            Image($r('app.media.home_text_smart_guest_room'))
              .width(180)
              .height(40)
              .objectFit(ImageFit.Contain)
            if (this.viewModel.hotelName.length > 0) {
              Text(this.viewModel.hotelName)
                .fontSize($r('app.float.text_caption'))
                .fontColor($r('app.color.text_hint'))
                .margin({ top: 4 })
            }
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
          .margin({ top: 24, bottom: 20 })

          AirconControl({
            settingTemp: this.viewModel.settingTemp,
            currentTemp: this.viewModel.currentTemp,
            isOn: this.viewModel.acPower,
            isLoading: this.viewModel.isLoading,
            onTempUp: (): void => { this.viewModel.tempUp(); },
            onTempDown: (): void => { this.viewModel.tempDown(); },
            onPowerToggle: (): void => { this.viewModel.togglePower(); }
          })
            .margin({ bottom: 16 })

          SceneModePanel({
            currentMode: this.viewModel.currentSceneMode,
            onModeSelect: (hardwareId: number, modeName: string): void => {
              this.viewModel.setSceneMode(hardwareId, modeName);
            }
          })
            .margin({ bottom: 16 })

          ServiceStatus({
            dndActive: this.viewModel.dndActive,
            cleanRequested: this.viewModel.cleanRequested,
            onDNDToggle: (): void => { this.viewModel.toggleDND(); },
            onCleanToggle: (): void => { this.viewModel.toggleClean(); },
            onGoodNight: (): void => { this.viewModel.goodNightMode(); }
          })
        }
        .width('100%')
        .padding({ left: $r('app.float.margin_page'), right: $r('app.float.margin_page') })
        .padding({ bottom: 24 })
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
