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
            .margin({ top: 24, bottom: 20 })

          DNDToggle({
            isOn: this.viewModel.dndOn,
            onToggle: (): void => {
              this.viewModel.toggleDND();
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          CleanRoom({
            isRequested: this.viewModel.cleanRequested,
            onRequestClean: (): void => {
              this.viewModel.requestClean();
              promptAction.showToast({
                message: '已通知客房服务',
                duration: 2000
              });
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          SOSButton({
            onConfirm: (): void => {
              this.showSOSConfirm();
            }
          })
            .margin({ bottom: $r('app.float.spacing_sm') })

          Row() {
            Image($r('app.media.service_btn_logout'))
              .width($r('app.float.icon_size_button'))
              .height($r('app.float.icon_size_button'))
              .margin({ right: $r('app.float.spacing_sm') })

            Text($r('app.string.service_logout'))
              .fontSize($r('app.float.text_body'))
              .fontColor($r('app.color.text_primary'))
          }
          .width('100%')
          .height(56)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .backgroundColor('rgba(255, 255, 255, 0.08)')
          .borderRadius($r('app.float.radius_card'))
          .onClick(() => {
            this.showLogoutConfirm();
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
