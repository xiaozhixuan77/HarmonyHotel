import { describe, it, expect } from '@ohos/hypium';
import { HomeViewModel } from '@ohos/home';
import { ApiResponse } from '@ohos/network';
import { RoomState, AirConditioner } from '@ohos/datastore';

function createMockRoomState(): ApiResponse<RoomState> {
  const mockAc: AirConditioner = { code: '', cpadd: '', name: 'kt1', location: '', id: 103136, settingTemp: 22, currentTemp: 19, mode: 0, speed: 1, open: 1 };
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
        qingli: '', wurao: '', sos: '',
        light_mode_1: '', light_mode_2: '', light_mode_3: '',
        light_mode_4: '', light_mode_5: '', light_mode_6: '',
        shaohou: '', tui: '', menci: '', ruzhu: ''
      },
      hardware: {
        airs: [mockAc],
        curtains: [],
        lights: [],
        lightModes: [],
        services: [],
        tvs: [],
        brightness: [],
        hasBrightness: false,
        hasTv: false
      }
    }
  };
}

export default function homeViewModelTest(): void {
  describe('HomeViewModel', () => {
    it('加载房间状态_AC数据正确', 0, async (done: Function) => {
      const vm = new HomeViewModel();
      vm.getRoomStateApi = () => Promise.resolve(createMockRoomState());
      await vm.loadRoomState();
      expect(vm.hotelName).assertEqual('智慧酒店');
      expect(vm.settingTemp).assertEqual(22);
      expect(vm.currentTemp).assertEqual(19);
      expect(vm.acPower).assertTrue();
      done();
    });

    it('温度加1_范围内_设置温度增加', 0, () => {
      const vm = new HomeViewModel();
      vm.clickAirBtnApi = (): Promise<ApiResponse<string>> => Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      vm.settingTemp = 22;
      vm.tempUp();
      expect(vm.settingTemp).assertEqual(23);
    });

    it('温度减1_范围内_设置温度减少', 0, () => {
      const vm = new HomeViewModel();
      vm.clickAirBtnApi = (): Promise<ApiResponse<string>> => Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      vm.settingTemp = 22;
      vm.tempDown();
      expect(vm.settingTemp).assertEqual(21);
    });

    it('温度加_已达30上限_温度不变', 0, () => {
      const vm = new HomeViewModel();
      vm.settingTemp = 30;
      vm.tempUp();
      expect(vm.settingTemp).assertEqual(30);
    });

    it('温度减_已达16下限_温度不变', 0, () => {
      const vm = new HomeViewModel();
      vm.settingTemp = 16;
      vm.tempDown();
      expect(vm.settingTemp).assertEqual(16);
    });

    it('温度防抖_连续调用_不立即发送API', 0, async (done: Function) => {
      const vm = new HomeViewModel();
      let callCount = 0;
      vm.clickAirBtnApi = (): Promise<ApiResponse<string>> => {
        callCount++;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      };
      vm.settingTemp = 22;
      vm.tempUp();
      vm.tempUp();
      vm.tempUp();
      // 防抖未到期，API 不应被调用
      expect(callCount).assertEqual(0);
      // 等待防抖到期
      setTimeout(() => {
        expect(callCount).assertEqual(1);
        expect(vm.settingTemp).assertEqual(25);
        done();
      }, 600);
    });

    it('场景模式切换_明亮模式_调用API并更新状态', 0, async (done: Function) => {
      const vm = new HomeViewModel();
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number): Promise<ApiResponse<string>> => {
        calledId = hardwareId;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.setSceneMode(103119, '明亮');
      expect(calledId).assertEqual(103119);
      expect(vm.currentSceneMode).assertEqual('明亮');
      done();
    });

    it('晚安模式_调用setLightMode_103004', 0, async (done: Function) => {
      const vm = new HomeViewModel();
      let calledId = 0;
      vm.setLightModeApi = (hardwareId: number): Promise<ApiResponse<string>> => {
        calledId = hardwareId;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      };
      await vm.goodNightMode();
      expect(calledId).assertEqual(103004);
      expect(vm.currentSceneMode).assertEqual('晚安');
      done();
    });

    it('AC开关_切换电源状态', 0, async (done: Function) => {
      const vm = new HomeViewModel();
      let cmdCalled = '';
      let valCalled = 0;
      vm.clickAirBtnApi = (cmd: string, value: number): Promise<ApiResponse<string>> => {
        cmdCalled = cmd;
        valCalled = value;
        return Promise.resolve<ApiResponse<string>>({ code: 0, msg: '成功', data: 'success', success: true });
      };
      vm.acPower = true;
      await vm.togglePower();
      expect(cmdCalled).assertEqual('power');
      expect(valCalled).assertEqual(0);
      expect(vm.acPower).assertFalse();
      done();
    });

    it('toggleDND_状态翻转', 0, () => {
      const vm = new HomeViewModel();
      expect(vm.dndActive).assertFalse();
      vm.toggleDND();
      expect(vm.dndActive).assertTrue();
      vm.toggleDND();
      expect(vm.dndActive).assertFalse();
    });

    it('toggleClean_状态翻转', 0, () => {
      const vm = new HomeViewModel();
      expect(vm.cleanRequested).assertFalse();
      vm.toggleClean();
      expect(vm.cleanRequested).assertTrue();
      vm.toggleClean();
      expect(vm.cleanRequested).assertFalse();
    });

    it('loadRoomState_失败_isLoading重置', 0, async (done: Function) => {
      const vm = new HomeViewModel();
      vm.getRoomStateApi = () => Promise.resolve({ code: 1, msg: '失败', data: createMockRoomState().data, success: false } as ApiResponse<RoomState>);
      await vm.loadRoomState();
      expect(vm.isLoading).assertFalse();
      done();
    });

    it('温度加_已达上限_API不调用', 0, () => {
      const vm = new HomeViewModel();
      let apiCalled = false;
      vm.clickAirBtnApi = (): Promise<ApiResponse<string>> => {
        apiCalled = true;
        return Promise.resolve({ code: 0, msg: '', data: '', success: true } as ApiResponse<string>);
      };
      vm.settingTemp = 30;
      vm.tempUp();
      expect(vm.settingTemp).assertEqual(30);
      expect(apiCalled).assertFalse();
    });

    it('温度减_已达下限_API不调用', 0, () => {
      const vm = new HomeViewModel();
      let apiCalled = false;
      vm.clickAirBtnApi = (): Promise<ApiResponse<string>> => {
        apiCalled = true;
        return Promise.resolve({ code: 0, msg: '', data: '', success: true } as ApiResponse<string>);
      };
      vm.settingTemp = 16;
      vm.tempDown();
      expect(vm.settingTemp).assertEqual(16);
      expect(apiCalled).assertFalse();
    });
  });
}
