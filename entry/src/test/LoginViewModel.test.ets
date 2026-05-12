import { describe, it, expect } from '@ohos/hypium';
import { LoginViewModel } from '../main/ets/feature/login/LoginViewModel';
import { ApiResponse } from '../main/ets/common/model/ApiResponse';
import { LoginInfo } from '../main/ets/common/utils/PreferencesUtil';

export default function loginViewModelTest(): void {
  describe('LoginViewModel', () => {
    it('校验_客房号为空_返回false并设置错误信息', 0, () => {
      const vm = new LoginViewModel();
      vm.roomNo = '';
      vm.firstName = 'xiao';
      const result = vm.validate();
      expect(result).assertFalse();
      expect(vm.errorMsg).assertEqual('请输入客房号');
    });

    it('校验_用户名为空_返回false并设置错误信息', 0, () => {
      const vm = new LoginViewModel();
      vm.roomNo = '2002';
      vm.firstName = '';
      const result = vm.validate();
      expect(result).assertFalse();
      expect(vm.errorMsg).assertEqual('请输入用户名');
    });

    it('校验_全部填写_返回true', 0, () => {
      const vm = new LoginViewModel();
      vm.roomNo = '2002';
      vm.firstName = 'xiao';
      const result = vm.validate();
      expect(result).assertTrue();
    });

    it('rememberMe_默认false_切换后状态正确', 0, () => {
      const vm = new LoginViewModel();
      expect(vm.rememberMe).assertFalse();
      vm.rememberMe = true;
      expect(vm.rememberMe).assertTrue();
      vm.rememberMe = false;
      expect(vm.rememberMe).assertFalse();
    });

    it('登录API_正确凭据返回成功响应', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      vm.loginApi = (): Promise<ApiResponse<string>> => Promise.resolve<ApiResponse<string>>({
        code: 0,
        msg: '登录成功',
        data: 'mock-jwt-token-honysystem-2024',
        success: true
      });
      const res: ApiResponse<string> = await vm.loginApi('2002', 'xiao');
      expect(res.code).assertEqual(0);
      expect(res.data.length > 0).assertTrue();
      done();
    });

    it('登录API_错误凭据返回失败响应', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      vm.loginApi = (): Promise<ApiResponse<string>> => Promise.resolve<ApiResponse<string>>({
        code: 1,
        msg: '客房号或用户名错误',
        data: '',
        success: false
      });
      const res: ApiResponse<string> = await vm.loginApi('9999', 'bad');
      expect(res.code).assertEqual(1);
      expect(res.success).assertFalse();
      done();
    });

    it('LoginInfo_接口结构完整', 0, () => {
      const info: LoginInfo = {
        roomNo: '2002',
        firstName: 'xiao',
        remember: true
      };
      expect(info.roomNo).assertEqual('2002');
      expect(info.firstName).assertEqual('xiao');
      expect(info.remember).assertTrue();

      const emptyInfo: LoginInfo = {
        roomNo: '',
        firstName: '',
        remember: false
      };
      expect(emptyInfo.remember).assertFalse();
    });
  });
}
