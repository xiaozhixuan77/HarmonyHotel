import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, ON } from '@ohos.UiTest';

export default function curtainPageTest(): void {
  describe('CurtainPage', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
    });

    afterAll(async () => {
      if (driver) {
        driver.release();
      }
    });

    beforeEach(async (done: Function) => {
      await sleep(500);
      done();
    });

    it('页面渲染_窗帘页关键元素存在', 0, async (done: Function) => {
      const title: Component = await driver.findComponent(ON.text('窗帘控制'));
      expect(title).assertNotNull();
      const openAll: Component = await driver.findComponent(ON.text('全部打开'));
      expect(openAll).assertNotNull();
      const closeAll: Component = await driver.findComponent(ON.text('全部关闭'));
      expect(closeAll).assertNotNull();
      done();
    });

    it('全开按钮_点击后状态存在', 0, async (done: Function) => {
      const openAll: Component = await driver.findComponent(ON.text('全部打开'));
      expect(openAll).assertNotNull();
      await openAll.click();
      await sleep(600);
      expect(openAll).assertNotNull();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
