import { common } from '@kit.AbilityKit';
import { ApiResponse } from '@ohos/common';
import { mockLogin } from '@ohos/common';
import {
  saveToken,
  getToken,
  saveLoginInfo,
  getLoginInfo,
  clearLoginInfo,
  LoginInfo
} from '@ohos/common';
import { setToken } from '@ohos/common';

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
      this.errorMsg = '请输入客房号';
      return false;
    }
    if (this.firstName.trim().length === 0) {
      this.errorMsg = '请输入用户名';
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
          this.errorMsg = res.msg || '客房号或用户名错误';
        return false;
      }
    } catch (err) {
      this.errorMsg = '网络连接失败';
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
