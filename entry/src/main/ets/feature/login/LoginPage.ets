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
      Image($r('app.media.bg_hotel_full.jpg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column() {
        Column() {
          Text('智慧客房')
            .fontSize($r('app.float.text_title'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 28 })

          Row() {
            Image($r('app.media.icon_input_room'))
              .width(24)
              .height(24)
              .margin({ right: 12 })
            TextInput({
              placeholder: $r('app.string.login_room_no'),
              text: this.viewModel.roomNo
            })
              .type(InputType.Number)
              .placeholderColor($r('app.color.text_hint'))
              .fontSize($r('app.float.text_body'))
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
          .backgroundColor($r('app.color.background'))
          .margin({ bottom: 16 })

          Row() {
            Image($r('app.media.icon_input_user'))
              .width(24)
              .height(24)
              .margin({ right: 12 })
            TextInput({
              placeholder: $r('app.string.login_user_name'),
              text: this.viewModel.firstName
            })
              .placeholderColor($r('app.color.text_hint'))
              .fontSize($r('app.float.text_body'))
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
          .backgroundColor($r('app.color.background'))
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
              .fontColor($r('app.color.text_secondary'))
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
              .color($r('app.color.primary'))
          }
        }
        .width('85%')
        .padding(24)
        .borderRadius($r('app.float.radius_card'))
        .backgroundColor($r('app.color.surface'))
        .shadow({
          radius: 20,
          color: 'rgba(0, 0, 0, 0.15)',
          offsetY: 4
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
