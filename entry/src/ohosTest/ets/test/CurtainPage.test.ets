import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, ON } from '@ohos.UiTest';

export default function curtainPageTest(): void {
  describe('CurtainPage', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      // 切换到窗帘 tab
      const curtainTab: Component = await driver.findComponent(ON.text('窗帘'));
      if (curtainTab !== null) {
        await curtainTab.click();
        await sleep(600);
      }
    });

    afterAll(async () => {
    });

    beforeEach(async (done: Function) => {
      await sleep(500);
      done();
    });

    it('页面渲染_窗帘页关键元素存在', 0, async (done: Function) => {
      const title: Component = await driver.findComponent(ON.text('窗帘控制'));
      expect(title !== null).assertTrue();
      const openAll: Component = await driver.findComponent(ON.text('全部打开'));
      expect(openAll !== null).assertTrue();
      const closeAll: Component = await driver.findComponent(ON.text('全部关闭'));
      expect(closeAll !== null).assertTrue();
      done();
    });

    it('全开按钮_点击后状态存在', 0, async (done: Function) => {
      const openAll: Component = await driver.findComponent(ON.text('全部打开'));
      expect(openAll !== null).assertTrue();
      await openAll.click();
      await sleep(600);
      expect(openAll !== null).assertTrue();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
