import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { Driver, Component, ON } from '@ohos.UiTest';

export default function productPageTest(): void {
  describe('MainPage_MultiDevice', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      await sleep(1000);
    });

    it('主页面渲染_关键导航元素存在', 0, async (done: Function) => {
      const homeTab: Component = await driver.findComponent(ON.text('首页'));
      expect(homeTab !== null).assertTrue();
      const lightTab: Component = await driver.findComponent(ON.text('灯光'));
      expect(lightTab !== null).assertTrue();
      const curtainTab: Component = await driver.findComponent(ON.text('窗帘'));
      expect(curtainTab !== null).assertTrue();
      const serviceTab: Component = await driver.findComponent(ON.text('服务'));
      expect(serviceTab !== null).assertTrue();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
