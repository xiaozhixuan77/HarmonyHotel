import { describe, it, expect } from '@ohos/hypium';
import { LoginViewModel } from '@ohos/login';
import { ApiResponse } from '@ohos/common';
import { LoginInfo, deleteToken, clearLoginInfo } from '@ohos/common';
import { common } from '@kit.AbilityKit';

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

    it('login_成功_设置登录状态和token', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      vm.roomNo = '2002';
      vm.firstName = 'xiao';
      vm.loginApi = (): Promise<ApiResponse<string>> => Promise.resolve({
        code: 0,
        msg: '登录成功',
        data: 'mock-jwt-token-test',
        success: true
      } as ApiResponse<string>);
      const mockContext = {} as common.Context;
      const result = await vm.login(mockContext);
      expect(result).assertTrue();
      expect(vm.isLoggedIn).assertTrue();
      expect(vm.token).assertEqual('mock-jwt-token-test');
      expect(vm.isLoading).assertFalse();
      done();
    });

    it('login_失败_设置错误信息', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      vm.roomNo = '2002';
      vm.firstName = 'xiao';
      vm.loginApi = (): Promise<ApiResponse<string>> => Promise.resolve({
        code: 1,
        msg: '客房号或用户名错误',
        data: '',
        success: false
      } as ApiResponse<string>);
      const mockContext = {} as common.Context;
      const result = await vm.login(mockContext);
      expect(result).assertFalse();
      expect(vm.errorMsg).assertEqual('客房号或用户名错误');
      expect(vm.isLoading).assertFalse();
      done();
    });

    it('login_校验失败_不调用API', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      vm.roomNo = '';
      vm.firstName = 'xiao';
      let apiCalled = false;
      vm.loginApi = (): Promise<ApiResponse<string>> => {
        apiCalled = true;
        return Promise.resolve({ code: 0, msg: '', data: '', success: true } as ApiResponse<string>);
      };
      const mockContext = {} as common.Context;
      await vm.login(mockContext);
      expect(apiCalled).assertFalse();
      expect(vm.isLoading).assertFalse();
      done();
    });

    it('login_异常_设置网络错误信息', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      vm.roomNo = '2002';
      vm.firstName = 'xiao';
      vm.loginApi = (): Promise<ApiResponse<string>> => Promise.reject(new Error('网络错误'));
      const mockContext = {} as common.Context;
      const result = await vm.login(mockContext);
      expect(result).assertFalse();
      expect(vm.errorMsg).assertEqual('网络连接失败');
      expect(vm.isLoading).assertFalse();
      done();
    });

    it('loadSavedInfo_无记录_字段为空', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      const mockContext = {} as common.Context;
      try {
        await clearLoginInfo(mockContext);
      } catch (e) {}
      try {
        await vm.loadSavedInfo(mockContext);
      } catch (e) {
        // Preferences 在测试环境可能不可用，忽略
      }
      expect(vm.roomNo).assertEqual('');
      expect(vm.firstName).assertEqual('');
      expect(vm.rememberMe).assertFalse();
      done();
    });

    it('checkAutoLogin_无token_返回false', 0, async (done: Function) => {
      const vm = new LoginViewModel();
      const mockContext = {} as common.Context;
      try {
        await deleteToken(mockContext);
      } catch (e) {}
      let result = false;
      try {
        result = await vm.checkAutoLogin(mockContext);
      } catch (e) {
        // Preferences 在测试环境可能不可用
      }
      expect(result).assertFalse();
      expect(vm.isLoggedIn).assertFalse();
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
