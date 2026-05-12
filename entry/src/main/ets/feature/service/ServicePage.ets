import { common } from '@kit.AbilityKit';
import { router, promptAction } from '@kit.ArkUI';
import { ServiceViewModel } from './ServiceViewModel';
import { DNDToggle } from './components/DNDToggle';
import { CleanRoom } from './components/CleanRoom';
import { SOSButton } from './components/SOSButton';

@ComponentV2
export struct ServicePage {
  @Local viewModel: ServiceViewModel = new ServiceViewModel();

  async aboutToAppear(): Promise<void> {
    await this.viewModel.loadServices();
  }

  private showLogoutConfirm(): void {
    promptAction.showDialog({
      title: '退出登录',
      message: '确定要退出登录吗？',
      buttons: [
        { text: '取消', color: '#666666' },
        { text: '确认', color: '#4A90D9' }
      ]
    }).then(async (data) => {
      if (data.index === 1) {
        const context: common.Context = getContext(this) as common.Context;
        await this.viewModel.logout(context);
        router.replaceUrl({ url: 'feature/login/LoginPage' });
      }
    }).catch(() => {});
  }

  private showSOSConfirm(): void {
    promptAction.showDialog({
      title: '紧急求救',
      message: '确定要发送 SOS 紧急求救信号吗？',
      buttons: [
        { text: '取消', color: '#666666' },
        { text: '确认', color: '#E53935' }
      ]
    }).then((data) => {
      if (data.index === 1) {
        this.viewModel.triggerSOS();
        promptAction.showToast({
          message: 'SOS 信号已发送',
          duration: 2000
        });
      }
    }).catch(() => {});
  }

  build() {
    Stack() {
      Image($r('app.media.service_bg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Scroll() {
        Column() {
          Text($r('app.string.page_service'))
            .fontSize($r('app.float.text_title'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .textAlign(TextAlign.Center)
            .margin({ top: 24 })

          Column() {
            Row() {
              DNDToggle({
                isOn: this.viewModel.dndOn,
                onToggle: (): void => {
                  this.viewModel.toggleDND();
                }
              })
                .layoutWeight(1)

              CleanRoom({
                isOn: this.viewModel.cleanRequested,
                onToggle: (): void => {
                  this.viewModel.requestClean();
                  promptAction.showToast({
                    message: '已通知客房服务',
                    duration: 2000
                  });
                }
              })
                .layoutWeight(1)
                .margin({ left: $r('app.float.spacing_sm') })
            }
            .width('100%')
            .margin({ bottom: 30 })

            SOSButton({
              onConfirm: (): void => {
                this.showSOSConfirm();
              }
            })
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .width('100%')

          Image($r('app.media.service_btn_logout'))
            .width('100%')
            .height(85)
            .objectFit(ImageFit.Fill)
            .borderRadius($r('app.float.radius_button'))
            .onClick(() => {
              this.showLogoutConfirm();
            })
        }
        .width('100%')
        .height('100%')
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
