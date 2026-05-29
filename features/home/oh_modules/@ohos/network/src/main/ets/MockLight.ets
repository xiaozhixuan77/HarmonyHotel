import { ApiResponse } from './ApiResponse';

const VALID_LIGHT_MODE_IDS: number[] = [103001, 103004, 103119, 103120, 103121, 103122, 103123];
const OFFLINE_DEVICE_ID = 999999;

export function mockSetLightMode(hardwareId: number): Promise<ApiResponse<string>> {
  return new Promise((resolve) => {
    setTimeout(() => {
      if (hardwareId === OFFLINE_DEVICE_ID) {
        resolve({
          code: 1,
          msg: '设备离线或无响应',
          data: '',
          success: false
        });
        return;
      }

      if (VALID_LIGHT_MODE_IDS.includes(hardwareId)) {
        resolve({
          code: 0,
          data: 'success',
          success: true,
          msg: '操作成功'
        });
      } else {
        resolve({
          code: 1,
          msg: '参数格式不正确',
          data: '',
          success: false
        });
      }
    }, 300);
  });
}
