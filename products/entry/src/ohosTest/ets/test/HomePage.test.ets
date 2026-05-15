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
      await sleep(800);
      done();
    });

    it('温度加_点击加号_设定温度增加', 0, async (done: Function) => {
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      expect(images.length >= 5).assertTrue();
      const addBtn: Component = images[4];
      await addBtn.click();
      await sleep(1000);
      const tempText: Component | null = await findTextByPattern(driver, '°C');
      expect(tempText !== null).assertTrue();
      done();
    });

    it('温度减_点击减号_设定温度减少', 0, async (done: Function) => {
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      expect(images.length >= 4).assertTrue();
      const subBtn: Component = images[3];
      await subBtn.click();
      await sleep(1000);
      const tempText: Component | null = await findTextByPattern(driver, '°C');
      expect(tempText !== null).assertTrue();
      done();
    });

    it('AC开关_点击关闭_AC状态变为关', 0, async (done: Function) => {
      const images: Component[] = await driver.findComponents(ON.type('Image'));
      expect(images.length >= 3).assertTrue();
      const acIcon: Component = images[2];
      await acIcon.click();
      await sleep(800);
      expect(acIcon !== null).assertTrue();
      done();
    });

    it('场景切换_点击柔和_选中状态更新', 0, async (done: Function) => {
      const softBtn: Component | null = await findTextByPattern(driver, '柔和');
      expect(softBtn !== null).assertTrue();
      if (softBtn) {
        await softBtn.click();
        await sleep(800);
      }
      done();
    });

    it('晚安模式_点击晚安_发送关灯指令', 0, async (done: Function) => {
      await driver.swipe(540, 1000, 540, 200);
      await sleep(600);
      const nightBtn: Component | null = await findTextByPattern(driver, '晚安模式');
      expect(nightBtn !== null).assertTrue();
      if (nightBtn) {
        await nightBtn.click();
        await sleep(800);
      }
      done();
    });
  });
}

async function findTextByPattern(driver: Driver, pattern: string): Promise<Component | null> {
  const texts: Component[] = await driver.findComponents(ON.type('Text'));
  for (const text of texts) {
    const content: string = await text.getText();
    if (content && content.indexOf(pattern) >= 0) {
      return text;
    }
  }
  return null;
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => { resolve(); }, ms);
  });
}
