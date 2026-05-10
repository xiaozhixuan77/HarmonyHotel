import { common } from '@kit.AbilityKit';
import { promptAction, router } from '@kit.ArkUI';
import { LoginViewModel } from './LoginViewModel';

@Entry
@ComponentV2
struct LoginPage {
  @Local viewModel: LoginViewModel = new LoginViewModel();

  async aboutToAppear(): Promise<void> {
    const context: common.Context = getContext(this) as common.Context;
    await this.viewModel.loadSavedInfo(context);
    const autoLogin: boolean = await this.viewModel.checkAutoLogin(context);
    if (autoLogin) {
      router.replaceUrl({ url: 'feature/main/MainPage' });
    }
  }

  build() {
    Stack() {
      Image($r('app.media.bg_hotel_full'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column() {
        Column() {
          Text('智慧客房')
            .fontSize($r('app.float.text_title'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 28 })

          Row() {
            Image($r('app.media.icon_input_room'))
              .width(24)
              .height(24)
              .margin({ right: 12 })
              .fillColor(Color.White)
            TextInput({
              placeholder: $r('app.string.login_room_no'),
              text: this.viewModel.roomNo
            })
              .type(InputType.Number)
              .placeholderColor('rgba(255, 255, 255, 0.45)')
              .fontSize($r('app.float.text_body'))
              .fontColor(Color.White)
              .layoutWeight(1)
              .backgroundColor(Color.Transparent)
              .onChange((value: string) => {
                this.viewModel.roomNo = value;
              })
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
          .height(48)
          .borderRadius($r('app.float.radius_card'))
          .backgroundColor('rgba(255, 255, 255, 0.12)')
          .margin({ bottom: 16 })

          Row() {
            Image($r('app.media.icon_input_user'))
              .width(24)
              .height(24)
              .margin({ right: 12 })
              .fillColor(Color.White)
            TextInput({
              placeholder: $r('app.string.login_user_name'),
              text: this.viewModel.firstName
            })
              .placeholderColor('rgba(255, 255, 255, 0.45)')
              .fontSize($r('app.float.text_body'))
              .fontColor(Color.White)
              .layoutWeight(1)
              .backgroundColor(Color.Transparent)
              .onChange((value: string) => {
                this.viewModel.firstName = value;
              })
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
          .height(48)
          .borderRadius($r('app.float.radius_card'))
          .backgroundColor('rgba(255, 255, 255, 0.12)')
          .margin({ bottom: 16 })

          Row() {
            Image(this.viewModel.rememberMe ?
              $r('app.media.icon_input_checked') :
              $r('app.media.icon_input_unchecked'))
              .width(20)
              .height(20)
              .margin({ right: 8 })
            Text($r('app.string.login_remember'))
              .fontSize($r('app.float.text_caption'))
              .fontColor('rgba(255, 255, 255, 0.7)')
          }
          .width('100%')
          .padding({ left: 4 })
          .margin({ bottom: 28 })
          .onClick(() => {
            this.viewModel.rememberMe = !this.viewModel.rememberMe;
          })

          Button($r('app.string.login_btn'))
            .type(ButtonType.Capsule)
            .width('100%')
            .height(48)
            .fontSize($r('app.float.text_body'))
            .fontColor(Color.White)
            .backgroundColor($r('app.color.primary'))
            .enabled(!this.viewModel.isLoading)
            .opacity(this.viewModel.isLoading ? 0.7 : 1.0)
            .onClick(async () => {
              const context: common.Context = getContext(this) as common.Context;
              const success: boolean = await this.viewModel.login(context);
              if (success) {
                router.replaceUrl({ url: 'feature/main/MainPage' });
              } else if (this.viewModel.errorMsg.length > 0) {
                promptAction.showToast({
                  message: this.viewModel.errorMsg,
                  duration: 2000
                });
              }
            })

          if (this.viewModel.isLoading) {
            LoadingProgress()
              .width(36)
              .height(36)
              .margin({ top: 16 })
              .color(Color.White)
          }
        }
        .width('85%')
        .padding(24)
        .borderRadius($r('app.float.radius_card'))
        .backgroundColor('rgba(0, 0, 0, 0.65)')
        .backdropBlur(10)
        .border({
          width: 1,
          color: 'rgba(255, 255, 255, 0.15)'
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
