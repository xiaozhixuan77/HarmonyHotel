import { describe, it, expect } from '@ohos/hypium';
import { CurtainViewModel } from '@ohos/curtain';
import { ApiResponse } from '@ohos/common';
import { RoomState, Curtain, CurtainState } from '@ohos/common';

function makeCurtain(sequence: number, cpadd: string, name: string, location: string, id: number, state?: CurtainState): Curtain {
  return { sequence, cpadd, name, location, id, state };
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
        lights: [],
        lightModes: [],
        curtains: [
          makeCurtain(0, '1', '窗帘1', '房间', 103137),
          makeCurtain(1, '2', '窗纱', '房间', 103127)
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

export default function curtainViewModelTest(): void {
  describe('CurtainViewModel', () => {
    it('加载窗帘列表_包含窗帘1和窗纱', 0, async (done: Function) => {
      const vm = new CurtainViewModel();
      vm.getRoomStateApi = () => Promise.resolve(createMockRoomState());
      await vm.loadCurtains();
      expect(vm.curtains.length).assertEqual(2);
      expect(vm.curtains[0].name).assertEqual('窗帘1');
      expect(vm.curtains[1].name).assertEqual('窗纱');
      expect(vm.curtains[0].state).assertEqual('close');
      done();
    });

    it('全开_所有窗帘状态变为open', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'close'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'close')
      ];
      vm.setAll('open');
      expect(vm.curtains[0].state).assertEqual('open');
      expect(vm.curtains[1].state).assertEqual('open');
    });

    it('全关_所有窗帘状态变为close', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'open'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'half')
      ];
      vm.setAll('close');
      expect(vm.curtains[0].state).assertEqual('close');
      expect(vm.curtains[1].state).assertEqual('close');
    });

    it('窗帘1_打开_状态变为open', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'close'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'close')
      ];
      vm.setCurtainState(0, 'open');
      expect(vm.curtains[0].state).assertEqual('open');
    });

    it('窗帘1_暂停_状态变为pause', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'open'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'close')
      ];
      vm.setCurtainState(0, 'pause');
      expect(vm.curtains[0].state).assertEqual('pause');
    });

    it('窗帘1_关闭_状态变为close', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'open'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'open')
      ];
      vm.setCurtainState(0, 'close');
      expect(vm.curtains[0].state).assertEqual('close');
    });

    it('窗帘1_半开_状态变为half', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'close'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'close')
      ];
      vm.setCurtainState(0, 'half');
      expect(vm.curtains[0].state).assertEqual('half');
    });

    it('窗纱_半开_状态变为half', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'close'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'close')
      ];
      vm.setCurtainState(1, 'half');
      expect(vm.curtains[1].state).assertEqual('half');
    });

    it('窗帘状态互斥_左右状态独立', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [
        makeCurtain(0, '1', '窗帘1', '房间', 103137, 'close'),
        makeCurtain(1, '2', '窗纱', '房间', 103127, 'close')
      ];
      vm.setCurtainState(0, 'open');
      vm.setCurtainState(1, 'close');
      expect(vm.curtains[0].state).assertEqual('open');
      expect(vm.curtains[1].state).assertEqual('close');
    });

    it('setCurtainState_索引越界_不报错', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [makeCurtain(0, '1', '窗帘1', '房间', 103137, 'close')];
      vm.setCurtainState(-1, 'open');
      vm.setCurtainState(999, 'open');
      expect(vm.curtains[0].state).assertEqual('close');
    });

    it('setCurtainState_状态相同_不操作', 0, () => {
      const vm = new CurtainViewModel();
      vm.curtains = [makeCurtain(0, '1', '窗帘1', '房间', 103137, 'open')];
      vm.setCurtainState(0, 'open');
      expect(vm.curtains[0].state).assertEqual('open');
    });
  });
}
