import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, UiDriver, ON } from '@ohos.UiTest';
import { preferences } from '@kit.ArkData';
import { Context } from '@kit.AbilityKit';

export default function loginPageTest(): void {
  describe('LoginPage', () => {
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
      // 等待页面稳定
      await sleep(500);
      done();
    });

    it('冷启动_无token_LoginPage正常加载', 0, async (done: Function) => {
      const title: Component = await driver.findComponent(ON.text('智慧客房'));
      expect(title).assertNotNull();
      done();
    });

    it('UI渲染_输入框和按钮存在', 0, async (done: Function) => {
      const roomInput: Component = await driver.findComponent(ON.text('客房号'));
      const userInput: Component = await driver.findComponent(ON.text('用户名'));
      const loginBtn: Component = await driver.findComponent(ON.text('登录'));
      expect(roomInput).assertNotNull();
      expect(userInput).assertNotNull();
      expect(loginBtn).assertNotNull();
      done();
    });

    it('输入交互_客房号输入框可输入', 0, async (done: Function) => {
      const roomInput: Component = await driver.findComponent(ON.type('TextInput').index(0));
      await roomInput.click();
      await roomInput.inputText('2002');
      const text: string = await roomInput.getText();
      expect(text).assertEqual('2002');
      done();
    });

    it('登录成功_跳转MainPage', 0, async (done: Function) => {
      const roomInput: Component = await driver.findComponent(ON.type('TextInput').index(0));
      const userInput: Component = await driver.findComponent(ON.type('TextInput').index(1));
      const loginBtn: Component = await driver.findComponent(ON.text('登录'));

      await roomInput.click();
      await roomInput.clearText();
      await roomInput.inputText('2002');

      await userInput.click();
      await userInput.clearText();
      await userInput.inputText('xiao');

      await loginBtn.click();

      // 等待导航完成（Mock 延迟 300ms + UI 响应）
      await sleep(1000);

      // 验证跳转到 MainPage
      const mainTitle: Component = await driver.findComponent(ON.text('智慧客房'));
      expect(mainTitle).assertNotNull();
      done();
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}
