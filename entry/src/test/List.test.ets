import localUnitTest from './LocalUnit.test';
import commonUtilsTest from './CommonUtils.test';
import mockApiTest from './MockApi.test';

export default function testsuite(): void {
  localUnitTest();
  commonUtilsTest();
  mockApiTest();
}
