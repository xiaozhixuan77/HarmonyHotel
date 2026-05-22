import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, ON } from '@ohos.UiTest';

export default function lightPageTest(): void {
  describe('LightPage', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      // 切换到灯光 tab
      const lightTab: Component = await driver.findComponent(ON.text('灯光'));
      if (lightTab !== null) {
        await lightTab.click();
        await sleep(600);
      }
    });

    afterAll(async () => {
    });

    beforeEach(async (done: Function) => {
      await sleep(500);
      done();
    });

    it('页面渲染_灯光页关键元素存在', 0, async (done: Function) => {
      const title: Component = await driver.findComponent(ON.text('灯光控制'));
      expect(title !== null).assertTrue();
      const mainSwitch: Component = await driver.findComponent(ON.text('一键全开'));
      expect(mainSwitch !== null).assertTrue();
      const sceneMode: Component = await driver.findComponent(ON.text('场景模式'));
      expect(sceneMode !== null).assertTrue();
      const independent: Component = await driver.findComponent(ON.text('独立灯光控制'));
      expect(independent !== null).assertTrue();
      done();
    });

    it('独立灯toggle_点击廊灯_toggle状态翻转', 0, async (done: Function) => {
      const langdengRow: Component = await driver.findComponent(ON.text('廊灯'));
      expect(langdengRow !== null).assertTrue();
      await langdengRow.click();
      await sleep(600);
      expect(langdengRow !== null).assertTrue();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
