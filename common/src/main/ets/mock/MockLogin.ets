import { ApiResponse } from '../model/ApiResponse';

export function mockLogin(roomNo: string, firstName: string): Promise<ApiResponse<string>> {
  return new Promise((resolve) => {
    setTimeout(() => {
      if (roomNo === '2002' && firstName === 'xiao') {
        resolve({
          code: 0,
          msg: '登录成功',
          data: 'mock-jwt-token-honysystem-2024',
          success: true
        });
      } else {
        resolve({
          code: 1,
          msg: '客房号或用户名错误',
          data: '',
          success: false
        });
      }
    }, 300);
  });
}
