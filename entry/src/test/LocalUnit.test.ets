import { describe, it, expect } from '@ohos/hypium';
import { setToken, getStoredToken, clearToken } from '../main/ets/common/api/ApiService';

export default function localUnitTest() {
  describe('ApiService', () => {
    it('token管理_设置后读取一致', 0, () => {
      setToken('test-token-123');
      expect(getStoredToken()).assertEqual('test-token-123');
    });

    it('token管理_清除后为空', 0, () => {
      setToken('test-token-123');
      clearToken();
      expect(getStoredToken()).assertEqual('');
    });

    it('token管理_覆盖更新', 0, () => {
      setToken('old-token');
      setToken('new-token');
      expect(getStoredToken()).assertEqual('new-token');
      clearToken();
    });
  });
}
