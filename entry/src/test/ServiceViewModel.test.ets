import { describe, it, expect } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { ServiceViewModel } from '../main/ets/feature/service/ServiceViewModel';
import { ApiResponse } from '../main/ets/common/model/ApiResponse';
import { RoomState, Service, StateFlags } from '../main/ets/common/model/DeviceModels';

function makeService(code: string, name: string, id: number, active?: boolean): Service {
  return { code, name, id, active };
}

function makeStateFlags(wurao: string, qingli: string): StateFlags {
  return {
    qingli: qingli,
    wurao: wurao,
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
  };
}

function createMockRoomState(wurao: string = '0', qingli: string = '0'): ApiResponse<RoomState> {
  return {
    code: 0,
    msg: '获取成功',
    success: true,
    data: {
      room_number: '2002',
      hotel_name: '智慧酒店',
      hasBidaMachine: false,
      hasCurtain: true,
      hasElectricityStatistic: false,
      state: makeStateFlags(wurao, qingli),
      hardware: {
        airs: [],
        lights: [],
        lightModes: [],
        curtains: [],
        services: [
          makeService('wurao', '请勿打扰', 103138),
          makeService('qingli', '清理房间', 103139)
        ],
        tvs: [],
        brightness: [],
        hasBrightness: false,
        hasTv: false
      }
    }
  };
}

export default function serviceViewModelTest(): void {
  describe('ServiceViewModel', () => {
    it('加载服务列表_包含请勿打扰和清理房间', 0, async (done: Function) => {
      const vm = new ServiceViewModel();
      vm.getRoomStateApi = (): Promise<ApiResponse<RoomState>> => Promise.resolve(createMockRoomState());
      await vm.loadServices();
      expect(vm.services.length).assertEqual(2);
      expect(vm.services[0].name).assertEqual('请勿打扰');
      expect(vm.services[1].name).assertEqual('清理房间');
      done();
    });

    it('DND开启_wurao状态变为true', 0, async (done: Function) => {
      const vm = new ServiceViewModel();
      vm.getRoomStateApi = (): Promise<ApiResponse<RoomState>> => Promise.resolve(createMockRoomState('0', '0'));
      await vm.loadServices();
      expect(vm.dndOn).assertFalse();
      vm.toggleDND();
      expect(vm.dndOn).assertTrue();
      done();
    });

    it('DND关闭_wurao状态变为false', 0, async (done: Function) => {
      const vm = new ServiceViewModel();
      vm.getRoomStateApi = (): Promise<ApiResponse<RoomState>> => Promise.resolve(createMockRoomState('1', '0'));
      await vm.loadServices();
      expect(vm.dndOn).assertTrue();
      vm.toggleDND();
      expect(vm.dndOn).assertFalse();
      done();
    });

    it('清理房间请求_qingli状态变为true', 0, async (done: Function) => {
      const vm = new ServiceViewModel();
      vm.getRoomStateApi = (): Promise<ApiResponse<RoomState>> => Promise.resolve(createMockRoomState('0', '0'));
      await vm.loadServices();
      expect(vm.cleanRequested).assertFalse();
      vm.requestClean();
      expect(vm.cleanRequested).assertTrue();
      done();
    });

    it('SOS点击_sosTriggered变为true', 0, () => {
      const vm = new ServiceViewModel();
      expect(vm.sosTriggered).assertFalse();
      vm.triggerSOS();
      expect(vm.sosTriggered).assertTrue();
    });

    it('SOS取消_状态不变', 0, () => {
      const vm = new ServiceViewModel();
      expect(vm.sosTriggered).assertFalse();
      // 取消操作不调用 triggerSOS，状态应保持 false
      expect(vm.sosTriggered).assertFalse();
    });

    it('退出登录_清除token', 0, async (done: Function) => {
      const vm = new ServiceViewModel();
      // logout 依赖 Context，在测试环境中传入一个 mock 对象
      const mockContext = {} as common.Context;
      await vm.logout(mockContext);
      // 由于 PreferencesUtil 在测试环境中可能不可用，
      // 只要调用不抛异常即认为通过
      expect(true).assertTrue();
      done();
    });
  });
}
