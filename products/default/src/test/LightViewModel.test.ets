import { describe, it, expect } from '@ohos/hypium';
import { LightViewModel } from '@ohos/light';
import { ApiResponse } from '@ohos/network';
import { RoomState, Light, LightMode } from '@ohos/datastore';

function makeLight(cpadd: string, name: string, location: string, id: number, on?: boolean): Light {
  return { cpadd, name, location, id, on };
}

function makeLightMode(cpadd: string, name: string, extra_name: string | null, location: string, id: number): LightMode {
  return { cpadd, name, extra_name, location, id };
}

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
          makeLight('1', '廊灯', '走廊', 103135),
          makeLight('60', '洗漱间', '房间', 103125),
          makeLight('23', '衣柜灯', '房间', 103128),
          makeLight('15', '落地灯', '房间', 103129),
          makeLight('14', '吧灯', '房间', 103130),
          makeLight('13', '书桌灯', '房间', 103131),
          makeLight('11', '左阅读灯', '房间', 103133),
          makeLight('12', '右阅读灯', '房间', 103132),
          makeLight('9', '排风扇', '房间', 103134)
        ],
        lightModes: [
          makeLightMode('1', '明亮模式', null, '房间', 103119),
          makeLightMode('2', '柔和模式', null, '房间', 103120),
          makeLightMode('3', '阅读模式', null, '房间', 103121),
          makeLightMode('4', '温馨模式', null, '房间', 103122),
          makeLightMode('5', '睡眠模式', null, '房间', 103123)
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
      vm.setLightModeApi = (hardwareId: number): Promise<ApiResponse<string>> => {
        calledId = hardwareId;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
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
      vm.lights = vm.lights.map((l: Light): Light => ({ cpadd: l.cpadd, name: l.name, location: l.location, id: l.id, on: false }));
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number): Promise<ApiResponse<string>> => {
        calledId = hardwareId;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
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
      vm.setLightModeApi = (hardwareId: number): Promise<ApiResponse<string>> => {
        calledId = hardwareId;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setSceneMode(103119, '明亮模式');
      expect(calledId).assertEqual(103119);
      expect(vm.currentSceneMode).assertEqual('明亮模式');
      done();
    });

    it('独立灯开关_廊灯状态翻转', 0, () => {
      const vm = new LightViewModel();
      vm.lights = [
        makeLight('1', '廊灯', '走廊', 103135, true)
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
      vm.setLightModeApi = (hardwareId: number): Promise<ApiResponse<string>> => {
        calledId = hardwareId;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setSceneMode(103123, '睡眠模式');
      expect(calledId).assertEqual(103123);
      expect(vm.currentSceneMode).assertEqual('睡眠模式');
      done();
    });

    it('主开关状态_部分灯关闭_返回false', 0, () => {
      const vm = new LightViewModel();
      vm.lights = [
        makeLight('1', '廊灯', '走廊', 103135, true),
        makeLight('60', '洗漱间', '房间', 103125, true)
      ];
      vm.toggleLight(1);
      expect(vm.mainSwitchOn).assertFalse();
    });

    it('toggleLight_索引越界_不报错且不改变状态', 0, () => {
      const vm = new LightViewModel();
      vm.lights = [makeLight('1', '廊灯', '走廊', 103135, true)];
      vm.toggleLight(-1);
      vm.toggleLight(999);
      expect(vm.lights[0].on).assertTrue();
    });

    it('setSceneMode_睡眠模式_所有灯关闭', 0, async (done: Function) => {
      const vm = new LightViewModel();
      vm.lights = [
        makeLight('1', '廊灯', '走廊', 103135, true),
        makeLight('60', '洗漱间', '房间', 103125, true)
      ];
      vm.setLightModeApi = (): Promise<ApiResponse<string>> => Promise.resolve({ code: 0, msg: '', data: '', success: true } as ApiResponse<string>);
      await vm.setSceneMode(103123, '睡眠模式');
      expect(vm.lights.every((l: Light) => !l.on)).assertTrue();
      done();
    });

    it('setSceneMode_非睡眠非全关模式_所有灯开启', 0, async (done: Function) => {
      const vm = new LightViewModel();
      vm.lights = [makeLight('1', '廊灯', '走廊', 103135, false)];
      vm.setLightModeApi = (): Promise<ApiResponse<string>> => Promise.resolve({ code: 0, msg: '', data: '', success: true } as ApiResponse<string>);
      await vm.setSceneMode(103119, '明亮模式');
      expect(vm.lights[0].on).assertTrue();
      done();
    });

    it('setSceneMode_全关模式_所有灯关闭', 0, async (done: Function) => {
      const vm = new LightViewModel();
      vm.lights = [makeLight('1', '廊灯', '走廊', 103135, true)];
      vm.setLightModeApi = (): Promise<ApiResponse<string>> => Promise.resolve({ code: 0, msg: '', data: '', success: true } as ApiResponse<string>);
      await vm.setSceneMode(103004, '总关模式');
      expect(vm.lights[0].on).assertFalse();
      done();
    });
  });
}
