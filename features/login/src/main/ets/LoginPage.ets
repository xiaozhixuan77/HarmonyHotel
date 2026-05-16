import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';
import { LoginViewModel } from './LoginViewModel';

@ComponentV2
export struct LoginPage {
  @Param onLoginSuccess: () => void = () => {};
  @Local viewModel: LoginViewModel = new LoginViewModel();

  async aboutToAppear(): Promise<void> {
    const context: common.Context = getContext(this) as common.Context;
    await this.viewModel.loadSavedInfo(context);
    const autoLogin: boolean = await this.viewModel.checkAutoLogin(context);
    if (autoLogin) {
      this.onLoginSuccess();
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
          Text($r('app.string.login_hotel_title'))
            .fontSize('35vp')
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)


          Text($r('app.string.login_hotel_subtitle'))
            .fontSize('19vp')
            .fontColor($r('app.color.text_secondary'))
            .margin({ top: 10, bottom: 28 })

          Row() {
            Image($r('app.media.icon_input_room'))
              .width($r('app.float.icon_size_tab'))
              .height($r('app.float.icon_size_tab'))
              .margin({ right: $r('app.float.spacing_sm'),left: 5 })
              .fillColor($r('app.color.text_secondary'))
            TextInput({
              placeholder: $r('app.string.login_room_no'),
              text: this.viewModel.roomNo
            })
              .type(InputType.Number)
              .placeholderColor($r('app.color.text_hint'))
              .fontSize($r('app.float.text_body'))
              .fontColor($r('app.color.text_primary'))
              .layoutWeight(1)
              .backgroundColor(Color.Transparent)
              .onChange((value: string) => {
                this.viewModel.roomNo = value;
              })
          }
          .width('100%')
          .padding({ left: $r('app.float.spacing_md'), right: $r('app.float.spacing_md') })
          .height($r('app.float.tab_bar_height'))
          .borderRadius($r('app.float.radius_card'))
          .backgroundColor('rgba(255, 255, 255, 0.12)')
          .margin({ bottom: $r('app.float.spacing_sm') })

          Row() {
            Image($r('app.media.icon_input_user'))
              .width($r('app.float.icon_size_tab'))
              .height($r('app.float.icon_size_tab'))
              .margin({ right: $r('app.float.spacing_sm') })
              .fillColor($r('app.color.text_secondary'))
            TextInput({
              placeholder: $r('app.string.login_user_name'),
              text: this.viewModel.firstName
            })
              .placeholderColor($r('app.color.text_hint'))
              .fontSize($r('app.float.text_body'))
              .fontColor($r('app.color.text_primary'))
              .layoutWeight(1)
              .backgroundColor(Color.Transparent)
              .onChange((value: string) => {
                this.viewModel.firstName = value;
              })
          }
          .width('100%')
          .padding({ left: $r('app.float.spacing_md'), right: $r('app.float.spacing_md') })
          .height($r('app.float.tab_bar_height'))
          .borderRadius($r('app.float.radius_card'))
          .backgroundColor('rgba(255, 255, 255, 0.12)')
          .margin({ bottom: $r('app.float.spacing_sm') })

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
            .height($r('app.float.tab_bar_height'))
            .fontSize($r('app.float.text_body'))
            .fontColor($r('app.color.text_primary'))
            .backgroundColor($r('app.color.primary'))
            .enabled(!this.viewModel.isLoading)
            .opacity(this.viewModel.isLoading ? 0.7 : 1.0)
            .onClick(async () => {
              const context: common.Context = getContext(this) as common.Context;
              const success: boolean = await this.viewModel.login(context);
              if (success) {
                this.onLoginSuccess();
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
              .margin({ top: $r('app.float.spacing_md') })
              .color($r('app.color.text_primary'))
          }
        }
        .width('85%')
        .padding($r('app.float.spacing_lg'))
        .borderRadius($r('app.float.radius_card'))
        .backgroundColor($r('app.color.card_bg'))
        .backdropBlur(10)
        .border({
          width: 1,
          color: 'rgba(255, 255, 255, 0.12)'
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
