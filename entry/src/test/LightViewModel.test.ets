import { describe, it, expect } from '@ohos/hypium';
import { LightViewModel } from '../main/ets/feature/light/LightViewModel';
import { ApiResponse } from '../main/ets/common/model/ApiResponse';
import { RoomState, Light, LightMode } from '../main/ets/common/model/DeviceModels';

function createMockRoomState(): ApiResponse<RoomState> {
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
      state: {
        qingli: '0', wurao: '0', sos: '0',
        light_mode_1: '0', light_mode_2: '0', light_mode_3: '0',
        light_mode_4: '0', light_mode_5: '0', light_mode_6: '0',
        shaohou: '0', tui: '0', menci: '0', ruzhu: '0'
      },
      hardware: {
        airs: [],
        curtains: [],
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
        services: [],
        tvs: [],
        brightness: [],
        hasBrightness: false,
        hasTv: false
      }
    }
  };
}

export default function lightViewModelTest(): void {
  describe('LightViewModel', () => {
    it('加载灯光列表_9个灯5个模式', 0, async (done: Function) => {
      const vm = new LightViewModel();
      vm.getRoomStateApi = () => Promise.resolve(createMockRoomState());
      await vm.loadLights();
      expect(vm.lights.length).assertEqual(9);
      expect(vm.lightModes.length).assertEqual(5);
      expect(vm.mainSwitchOn).assertTrue();
      done();
    });

    it('主开关_全关_调用103004', 0, async (done: Function) => {
      const vm = new LightViewModel();
      vm.getRoomStateApi = () => Promise.resolve(createMockRoomState());
      await vm.loadLights();
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number) => {
        calledId = hardwareId;
        return Promise.resolve({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setAllLights(false);
      expect(calledId).assertEqual(103004);
      expect(vm.mainSwitchOn).assertFalse();
      expect(vm.lights.every((l: Light) => !l.on)).assertTrue();
      done();
    });

    it('主开关_全开_调用103001', 0, async (done: Function) => {
      const vm = new LightViewModel();
      vm.getRoomStateApi = () => Promise.resolve(createMockRoomState());
      await vm.loadLights();
      vm.lights = vm.lights.map((l: Light) => ({ ...l, on: false }));
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number) => {
        calledId = hardwareId;
        return Promise.resolve({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setAllLights(true);
      expect(calledId).assertEqual(103001);
      expect(vm.mainSwitchOn).assertTrue();
      expect(vm.lights.every((l: Light) => l.on)).assertTrue();
      done();
    });

    it('场景模式切换_明亮模式_调用103119', 0, async (done: Function) => {
      const vm = new LightViewModel();
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number) => {
        calledId = hardwareId;
        return Promise.resolve({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setSceneMode(103119, '明亮模式');
      expect(calledId).assertEqual(103119);
      expect(vm.currentSceneMode).assertEqual('明亮模式');
      done();
    });

    it('独立灯开关_廊灯状态翻转', 0, () => {
      const vm = new LightViewModel();
      vm.lights = [
        { cpadd: '1', name: '廊灯', location: '走廊', id: 103135, on: true }
      ];
      expect(vm.mainSwitchOn).assertTrue();
      expect(vm.lights[0].on).assertTrue();
      vm.toggleLight(0);
      expect(vm.lights[0].on).assertFalse();
      expect(vm.mainSwitchOn).assertFalse();
    });

    it('睡眠模式_调用103123', 0, async (done: Function) => {
      const vm = new LightViewModel();
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number) => {
        calledId = hardwareId;
        return Promise.resolve({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setSceneMode(103123, '睡眠模式');
      expect(calledId).assertEqual(103123);
      expect(vm.currentSceneMode).assertEqual('睡眠模式');
      done();
    });

    it('主开关状态_部分灯关闭_返回false', 0, () => {
      const vm = new LightViewModel();
      vm.lights = [
        { cpadd: '1', name: '廊灯', location: '走廊', id: 103135, on: true },
        { cpadd: '60', name: '洗漱间', location: '房间', id: 103125, on: true }
      ];
      vm.toggleLight(1);
      expect(vm.mainSwitchOn).assertFalse();
    });
  });
}
