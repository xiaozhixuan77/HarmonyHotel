import { describe, it, expect } from '@ohos/hypium';
import { mockLogin } from '../main/ets/common/mock/MockLogin';
import { mockGetRoomState } from '../main/ets/common/mock/MockRoomState';
import { mockSetLightMode } from '../main/ets/common/mock/MockLight';
import { mockClickAirBtn } from '../main/ets/common/mock/MockAircon';

export default function mockApiTest(): void {
  describe('MockApi', () => {
    describe('MockLogin', () => {
      it('登录-成功', 0, async (done: Function) => {
        const res = await mockLogin('2002', 'xiao');
        expect(res.code).assertEqual(0);
        expect(res.data).assertEqual('mock-jwt-token-honysystem-2024');
        expect(res.success).assertEqual(true);
        done();
      });

      it('登录-失败', 0, async (done: Function) => {
        const res = await mockLogin('0000', 'bad');
        expect(res.code).assertEqual(1);
        expect(res.msg).assertContain('错误');
        expect(res.success).assertEqual(false);
        done();
      });
    });

    describe('MockRoomState', () => {
      it('获取房间状态', 0, async (done: Function) => {
        const res = await mockGetRoomState('2002');
        expect(res.code).assertEqual(0);
        expect(res.data.room_number).assertEqual('2002');
        expect(res.data.hotel_name).assertEqual('智慧酒店');
        expect(res.data.hardware.airs.length).assertEqual(1);
        expect(res.data.hardware.airs[0].id).assertEqual(103136);
        expect(res.data.hardware.lights.length).assertEqual(9);
        expect(res.data.hardware.lightModes.length).assertEqual(5);
        expect(res.data.hardware.curtains.length).assertEqual(2);
        expect(res.data.hardware.services.length).assertEqual(2);
        expect(res.success).assertEqual(true);
        done();
      });
    });

    describe('MockLight', () => {
      it('设置灯光模式-成功', 0, async (done: Function) => {
        const res = await mockSetLightMode(103119);
        expect(res.code).assertEqual(0);
        expect(res.success).assertEqual(true);
        done();
      });

      it('设置灯光模式-总开', 0, async (done: Function) => {
        const res = await mockSetLightMode(103001);
        expect(res.code).assertEqual(0);
        done();
      });

      it('设置灯光模式-总关', 0, async (done: Function) => {
        const res = await mockSetLightMode(103004);
        expect(res.code).assertEqual(0);
        done();
      });

      it('设置灯光模式-无效ID', 0, async (done: Function) => {
        const res = await mockSetLightMode(999);
        expect(res.code).assertEqual(1);
        expect(res.msg).assertContain('参数');
        expect(res.success).assertEqual(false);
        done();
      });

      it('设置灯光模式-设备离线', 0, async (done: Function) => {
        const res = await mockSetLightMode(999999);
        expect(res.code).assertEqual(1);
        expect(res.msg).assertContain('离线');
        expect(res.success).assertEqual(false);
        done();
      });
    });

    describe('MockAircon', () => {
      it('空调-设置温度', 0, async (done: Function) => {
        const res = await mockClickAirBtn('temp', 24, 103136);
        expect(res.code).assertEqual(0);
        expect(res.success).assertEqual(true);
        done();
      });

      it('空调-设置模式', 0, async (done: Function) => {
        const res = await mockClickAirBtn('mode', 1, 103136);
        expect(res.code).assertEqual(0);
        done();
      });

      it('空调-设置风速', 0, async (done: Function) => {
        const res = await mockClickAirBtn('speed', 2, 103136);
        expect(res.code).assertEqual(0);
        done();
      });

      it('空调-开关', 0, async (done: Function) => {
        const res = await mockClickAirBtn('power', 1, 103136);
        expect(res.code).assertEqual(0);
        done();
      });

      it('空调-温度越界', 0, async (done: Function) => {
        const res = await mockClickAirBtn('temp', 35, 103136);
        expect(res.code).assertEqual(1);
        expect(res.msg).assertContain('参数');
        expect(res.success).assertEqual(false);
        done();
      });

      it('空调-温度低于下限', 0, async (done: Function) => {
        const res = await mockClickAirBtn('temp', 10, 103136);
        expect(res.code).assertEqual(1);
        done();
      });

      it('空调-设备离线', 0, async (done: Function) => {
        const res = await mockClickAirBtn('temp', 22, 999);
        expect(res.code).assertEqual(1);
        expect(res.msg).assertContain('离线');
        done();
      });

      it('空调-无效cmd参数', 0, async (done: Function) => {
        const res = await mockClickAirBtn('invalid', 1, 103136);
        expect(res.code).assertEqual(1);
        expect(res.msg).assertContain('参数');
        expect(res.success).assertEqual(false);
        done();
      });
    });

    describe('Mock延迟', () => {
      it('登录Mock延迟约300ms', 0, async (done: Function) => {
        const start = Date.now();
        await mockLogin('2002', 'xiao');
        const elapsed = Date.now() - start;
        expect(elapsed >= 250 && elapsed <= 350).assertEqual(true);
        done();
      });

      it('客房状态Mock延迟约300ms', 0, async (done: Function) => {
        const start = Date.now();
        await mockGetRoomState('2002');
        const elapsed = Date.now() - start;
        expect(elapsed >= 250 && elapsed <= 350).assertEqual(true);
        done();
      });
    });
  });
}
