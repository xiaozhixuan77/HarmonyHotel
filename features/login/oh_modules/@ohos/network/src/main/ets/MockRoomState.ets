import { ApiResponse } from './ApiResponse';
import { RoomState } from '@ohos/datastore';

const MOCK_ROOM_STATE: RoomState = {
  room_number: '2002',
  hotel_name: '智慧酒店',
  hasBidaMachine: false,
  hasCurtain: true,
  hasElectricityStatistic: false,
  state: {
    qingli: '0',
    wurao: '0',
    sos: '0',
    light_mode_1: '0',
    light_mode_2: '0',
    light_mode_3: '0',
    light_mode_4: '0',
    light_mode_5: '0',
    light_mode_6: '0',
    shaohou: '0',
    tui: '0',
    menci: '0',
    ruzhu: '0'
  },
  hardware: {
    airs: [
      {
        code: 'kt1',
        cpadd: '1',
        name: '空调1',
        location: '房间',
        id: 103136,
        settingTemp: 22,
        currentTemp: 19,
        mode: 0,
        speed: 1,
        open: 1
      }
    ],
    lights: [
      { cpadd: '1', name: '廊灯', location: '走廊', id: 103135 },
      { cpadd: '60', name: '洗漱间', location: '房间', id: 103125 },
      { cpadd: '23', name: '衣柜灯', location: '房间', id: 103128 },
      { cpadd: '15', name: '落地灯', location: '房间', id: 103129 },
      { cpadd: '14', name: '吧灯', location: '房间', id: 103130 },
      { cpadd: '13', name: '书桌灯', location: '房间', id: 103131 },
      { cpadd: '11', name: '左阅读灯', location: '房间', id: 103133 },
      { cpadd: '12', name: '右阅读灯', location: '房间', id: 103132 },
      { cpadd: '9', name: '排风扇', location: '房间', id: 103134 }
    ],
    lightModes: [
      { cpadd: '1', name: '明亮模式', extra_name: null, location: '房间', id: 103119 },
      { cpadd: '2', name: '柔和模式', extra_name: null, location: '房间', id: 103120 },
      { cpadd: '3', name: '阅读模式', extra_name: null, location: '房间', id: 103121 },
      { cpadd: '4', name: '温馨模式', extra_name: null, location: '房间', id: 103122 },
      { cpadd: '5', name: '睡眠模式', extra_name: null, location: '房间', id: 103123 }
    ],
    curtains: [
      { sequence: 0, cpadd: '1', name: '窗帘1', location: '房间', id: 103137 },
      { sequence: 1, cpadd: '2', name: '窗纱', location: '房间', id: 103127 }
    ],
    services: [
      { code: 'wurao', name: '请勿打扰', id: 103138 },
      { code: 'qingli', name: '清理房间', id: 103139 }
    ],
    tvs: [],
    brightness: [],
    hasBrightness: false,
    hasTv: false
  }
};

export function mockGetRoomState(roomNo: string): Promise<ApiResponse<RoomState>> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve({
        code: 0,
        msg: '获取成功',
        data: MOCK_ROOM_STATE,
        success: true
      });
    }, 300);
  });
}
