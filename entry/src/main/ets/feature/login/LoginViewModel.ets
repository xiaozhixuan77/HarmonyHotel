import { common } from '@kit.AbilityKit';
import { ApiResponse } from '../../common/model/ApiResponse';
import { mockLogin } from '../../common/mock/MockLogin';
import {
  saveToken,
  getToken,
  saveLoginInfo,
  getLoginInfo,
  clearLoginInfo,
  LoginInfo
} from '../../common/utils/PreferencesUtil';
import { setToken } from '../../common/api/ApiService';

@ObservedV2
export class LoginViewModel {
  @Trace roomNo: string = '';
  @Trace firstName: string = '';
  @Trace rememberMe: boolean = false;
  @Trace isLoading: boolean = false;
  @Trace errorMsg: string = '';
  @Trace isLoggedIn: boolean = false;
  @Trace token: string = '';

  loginApi: (roomNo: string, firstName: string) => Promise<ApiResponse<string>> = mockLogin;

  validate(): boolean {
    if (this.roomNo.trim().length === 0) {
      this.errorMsg = $r('app.string.login_error_empty_room').toString();
      return false;
    }
    if (this.firstName.trim().length === 0) {
      this.errorMsg = $r('app.string.login_error_empty_user').toString();
      return false;
    }
    return true;
  }

  async login(context: common.Context): Promise<boolean> {
    if (!this.validate()) {
      return false;
    }

    this.isLoading = true;
    this.errorMsg = '';

    try {
      const res: ApiResponse<string> = await this.loginApi(this.roomNo, this.firstName);
      if (res.code === 0 && res.data) {
        this.isLoggedIn = true;
        this.token = res.data;
        await saveToken(context, this.token);
        setToken(this.token);
        if (this.rememberMe) {
          await saveLoginInfo(context, this.roomNo, this.firstName);
        } else {
          await clearLoginInfo(context);
        }
        return true;
      } else {
        this.errorMsg = res.msg || $r('app.string.login_error_auth').toString();
        return false;
      }
    } catch (err) {
      this.errorMsg = $r('app.string.common_network_error').toString();
      return false;
    } finally {
      this.isLoading = false;
    }
  }

  async loadSavedInfo(context: common.Context): Promise<void> {
    const info: LoginInfo = await getLoginInfo(context);
    if (info.remember) {
      this.roomNo = info.roomNo;
      this.firstName = info.firstName;
      this.rememberMe = true;
    }
  }

  async checkAutoLogin(context: common.Context): Promise<boolean> {
    const savedToken: string = await getToken(context);
    if (savedToken.length > 0) {
      this.isLoggedIn = true;
      this.token = savedToken;
      setToken(savedToken);
      return true;
    }
    return false;
  }
}
