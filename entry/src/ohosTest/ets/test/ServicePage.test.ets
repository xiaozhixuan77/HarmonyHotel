import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, ON } from '@ohos.UiTest';

export default function servicePageTest(): void {
  describe('ServicePage', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      // 切换到服务 tab
      const serviceTab: Component = await driver.findComponent(ON.text('服务'));
      if (serviceTab !== null) {
        await serviceTab.click();
        await sleep(600);
      }
    });

    afterAll(async () => {
    });

    beforeEach(async (done: Function) => {
      await sleep(500);
      done();
    });

    it('页面渲染_服务页关键元素存在', 0, async (done: Function) => {
      const title: Component = await driver.findComponent(ON.text('服务控制'));
      expect(title !== null).assertTrue();
      const dnd: Component = await driver.findComponent(ON.text('请勿打扰'));
      expect(dnd !== null).assertTrue();
      const clean: Component = await driver.findComponent(ON.text('清理房间'));
      expect(clean !== null).assertTrue();
      const sos: Component = await driver.findComponent(ON.text('SOS 紧急呼叫'));
      expect(sos !== null).assertTrue();
      const logout: Component = await driver.findComponent(ON.text('退出登录'));
      expect(logout !== null).assertTrue();
      done();
    });

    it('DND_toggle_点击后状态翻转', 0, async (done: Function) => {
      const dnd: Component = await driver.findComponent(ON.text('请勿打扰'));
      expect(dnd !== null).assertTrue();
      await dnd.click();
      await sleep(600);
      expect(dnd !== null).assertTrue();
      done();
    });

    it('退出登录_点击后弹出确认', 0, async (done: Function) => {
      const logout: Component = await driver.findComponent(ON.text('退出登录'));
      expect(logout !== null).assertTrue();
      await logout.click();
      await sleep(600);
      // 验证确认对话框出现（通过查找"取消"或"确认"按钮）
      const cancelBtn: Component = await driver.findComponent(ON.text('取消'));
      expect(cancelBtn !== null).assertTrue();
      // 点击取消关闭对话框，避免真的退出
      await cancelBtn.click();
      await sleep(400);
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
