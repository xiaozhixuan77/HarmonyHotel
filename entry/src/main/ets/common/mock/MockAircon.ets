import { ApiResponse } from '../model/ApiResponse';

export function mockClickAirBtn(cmd: string, value: number, airId: number): Promise<ApiResponse<string>> {
  return new Promise((resolve) => {
    setTimeout(() => {
      if (airId !== 103136) {
        resolve({
          code: 1,
          msg: '设备离线或无响应',
          data: '',
          success: false
        });
        return;
      }

      if (cmd === 'temp') {
        if (value < 16 || value > 30) {
          resolve({
            code: 1,
            msg: '参数格式不正确',
            data: '',
            success: false
          });
          return;
        }
      }

      if (cmd === 'mode' && (value < 0 || value > 4)) {
        resolve({
          code: 1,
          msg: '参数格式不正确',
          data: '',
          success: false
        });
        return;
      }

      if (cmd === 'speed' && (value < 0 || value > 3)) {
        resolve({
          code: 1,
          msg: '参数格式不正确',
          data: '',
          success: false
        });
        return;
      }

      if (cmd === 'power' && (value < 0 || value > 1)) {
        resolve({
          code: 1,
          msg: '参数格式不正确',
          data: '',
          success: false
        });
        return;
      }

      if (cmd !== 'temp' && cmd !== 'mode' && cmd !== 'speed' && cmd !== 'power') {
        resolve({
          code: 1,
          msg: '参数格式不正确',
          data: '',
          success: false
        });
        return;
      }

      resolve({
        code: 0,
        data: 'success',
        success: true,
        msg: '操作成功'
      });
    }, 300);
  });
}
