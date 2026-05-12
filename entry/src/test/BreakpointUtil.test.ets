import { describe, it, expect } from '@ohos/hypium';
import { getBreakpoint } from '../main/ets/common/utils/BreakpointUtil';

export default function breakpointUtilTest(): void {
  describe('BreakpointUtil', () => {
    it('getBreakpoint_手机_宽度小于600返回sm', 0, () => {
      expect(getBreakpoint(0)).assertEqual('sm');
      expect(getBreakpoint(599)).assertEqual('sm');
    });

    it('getBreakpoint_平板_宽度600到839返回md', 0, () => {
      expect(getBreakpoint(600)).assertEqual('md');
      expect(getBreakpoint(700)).assertEqual('md');
      expect(getBreakpoint(839)).assertEqual('md');
    });

    it('getBreakpoint_折叠屏_宽度大于等于840返回lg', 0, () => {
      expect(getBreakpoint(840)).assertEqual('lg');
      expect(getBreakpoint(1000)).assertEqual('lg');
    });
  });
}
