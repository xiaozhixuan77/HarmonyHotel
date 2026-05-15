import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { debounce } from '@ohos/common';

export default function commonUtilsTest(): void {
  describe('CommonUtils', () => {
    describe('DebounceUtil', () => {
      it('防抖-单次调用', 0, async (done: Function) => {
        let callCount = 0;
        const fn = debounce(() => {
          callCount++;
        }, 200);

        fn();
        setTimeout(() => {
          expect(callCount).assertEqual(1);
          done();
        }, 400);
      });

      it('防抖-连续调用', 0, async (done: Function) => {
        let callCount = 0;
        const fn = debounce(() => {
          callCount++;
        }, 300);

        fn();
        fn();
        fn();
        fn();
        fn();

        setTimeout(() => {
          expect(callCount).assertEqual(1);
          done();
        }, 600);
      });

      it('防抖-参数正确', 0, async (done: Function) => {
        let lastValue = '';
        const fn = debounce((val: string) => {
          lastValue = val;
        }, 200);

        fn('first');
        fn('second');
        fn('third');

        setTimeout(() => {
          expect(lastValue).assertEqual('third');
          done();
        }, 500);
      });
    });
  });
}
