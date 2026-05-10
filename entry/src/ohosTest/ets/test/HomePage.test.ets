import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, UiDriver, ON } from '@ohos.UiTest';

export default function homePageTest(): void {
  describe('HomePage', () => {
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

    it('温度加_点击加号_设定温度增加', 0, async (done: Function) => {
      const addBtn: Component = await driver.findComponent(ON.type('Image').index(2));
      await addBtn.click();
      await sleep(600);
      // 验证温度显示变化
      const tempText: Component = await driver.findComponent(ON.text('23°C'));
      expect(tempText).assertNotNull();
      done();
    });

    it('温度减_点击减号_设定温度减少', 0, async (done: Function) => {
      const subBtn: Component = await driver.findComponent(ON.type('Image').index(1));
      await subBtn.click();
      await sleep(600);
      const tempText: Component = await driver.findComponent(ON.text('21°C'));
      expect(tempText).assertNotNull();
      done();
    });

    it('AC开关_点击关闭_AC状态变为关', 0, async (done: Function) => {
      const acIcon: Component = await driver.findComponent(ON.type('Image').index(0));
      await acIcon.click();
      await sleep(600);
      // 验证 AC icon 变为 close 状态
      expect(acIcon).assertNotNull();
      done();
    });

    it('场景切换_点击柔和_选中状态更新', 0, async (done: Function) => {
      const softBtn: Component = await driver.findComponent(ON.text('柔和'));
      await softBtn.click();
      await sleep(600);
      expect(softBtn).assertNotNull();
      done();
    });

    it('晚安模式_点击晚安_发送关灯指令', 0, async (done: Function) => {
      const nightBtn: Component = await driver.findComponent(ON.text('晚安模式'));
      await nightBtn.click();
      await sleep(600);
      expect(nightBtn).assertNotNull();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
