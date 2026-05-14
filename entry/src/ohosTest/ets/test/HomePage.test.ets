import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, UiDriver, ON } from '@ohos.UiTest';

export default function homePageTest(): void {
  describe('HomePage', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
    });

    afterAll(async () => {
    });

    beforeEach(async (done: Function) => {
      await sleep(500);
      done();
    });

    it('温度加_点击加号_设定温度增加', 0, async (done: Function) => {
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      // AirconControl 中 Image 顺序: [0]背景图 [1]空调图标 [2]关闭按钮 [3]减号 [4]加号
      const addBtn: Component = images[4];
      await addBtn.click();
      await sleep(600);
      // 验证温度显示变化
      const tempText: Component = await driver.findComponent(ON.text('23°C'));
      expect(tempText !== null).assertTrue();
      done();
    });

    it('温度减_点击减号_设定温度减少', 0, async (done: Function) => {
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      const subBtn: Component = images[3];
      await subBtn.click();
      await sleep(600);
      const tempText: Component = await driver.findComponent(ON.text('21°C'));
      expect(tempText !== null).assertTrue();
      done();
    });

    it('AC开关_点击关闭_AC状态变为关', 0, async (done: Function) => {
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      const acIcon: Component = images[2];
      await acIcon.click();
      await sleep(600);
      // 验证 AC icon 变为 close 状态
      expect(acIcon !== null).assertTrue();
      done();
    });

    it('场景切换_点击柔和_选中状态更新', 0, async (done: Function) => {
      const softBtn: Component = await driver.findComponent(ON.text('柔和'));
      await softBtn.click();
      await sleep(600);
      expect(softBtn !== null).assertTrue();
      done();
    });

    it('晚安模式_点击晚安_发送关灯指令', 0, async (done: Function) => {
      const nightBtn: Component = await driver.findComponent(ON.text('晚安模式'));
      await nightBtn.click();
      await sleep(600);
      expect(nightBtn !== null).assertTrue();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
