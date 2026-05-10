import localUnitTest from './LocalUnit.test';
import commonUtilsTest from './CommonUtils.test';
import mockApiTest from './MockApi.test';
import loginViewModelTest from './LoginViewModel.test';
import homeViewModelTest from './HomeViewModel.test';

export default function testsuite(): void {
  localUnitTest();
  commonUtilsTest();
  mockApiTest();
  loginViewModelTest();
  homeViewModelTest();
}
