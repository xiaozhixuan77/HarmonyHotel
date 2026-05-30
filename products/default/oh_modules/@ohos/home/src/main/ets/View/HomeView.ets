import { HomeViewModel, getHomeViewModel } from '../ViewModel/HomeViewModel';
import { AirconControl } from './components/AirconControl';
import { SceneModePanel } from './components/SceneModePanel';
import { ServiceStatus } from './components/ServiceStatus';
import { promptAction } from '@kit.ArkUI';
@ComponentV2
export struct HomePage {
  @Local viewModel: HomeViewModel = getHomeViewModel();

  aboutToAppear(): void {
    this.viewModel.loadRoomState();
  }

  build() {
    Scroll() {
        Column() {
          Row() {
            Column() {
              Image($r('app.media.home_text_smart_guest_room'))
                .width(140)
                .height(32)
                .objectFit(ImageFit.Contain)
                .margin({left:8})
              Row() {
                Text($r('app.string.home_welcome'))
                  .fontSize($r('app.float.text_caption'))
                  .fontColor($r('app.color.text_secondary'))
                  .margin({left:13})
                Text($r('app.string.home_room_prefix'))
                  .fontSize($r('app.float.text_caption'))
                  .fontColor($r('app.color.text_secondary'))
                Text(this.viewModel.roomNumber)
                  .fontSize($r('app.float.text_caption'))
                  .fontColor($r('app.color.text_secondary'))

              }
              .margin({ top: 2 })
            }
            .alignItems(HorizontalAlign.Start)

            Blank()

            if (this.viewModel.hotelName.length > 0) {
              Text(this.viewModel.hotelName)
                .fontSize($r('app.float.text_caption'))
                .fontColor($r('app.color.text_primary'))
                .alignSelf(ItemAlign.Start)
            }
          }
          .width('100%')
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
            .margin({ bottom: $r('app.float.spacing_md') })

          SceneModePanel({
            currentMode: this.viewModel.currentSceneMode,
            onModeSelect: (hardwareId: number, modeName: string): void => {
              this.viewModel.setSceneMode(hardwareId, modeName);
            }
          })
            .margin({ bottom: $r('app.float.spacing_md') })

          ServiceStatus({
            dndActive: this.viewModel.dndActive,
            cleanRequested: this.viewModel.cleanRequested,
            onDNDToggle: (): void => { this.viewModel.toggleDND(); },
            onCleanToggle: (): void => {
              this.viewModel.toggleClean();
              promptAction.showToast({
                message: this.viewModel.cleanRequested ? '已通知客房服务' : '已取消客房服务',
                duration: 2000
              });
            },
            onGoodNight: (): void => { this.viewModel.goodNightMode(); }
          })
        }
        .width('100%')
        .padding({ left: $r('app.float.spacing_lg'), right: $r('app.float.spacing_lg') })
        .padding({ bottom: 24 })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
  }
}
