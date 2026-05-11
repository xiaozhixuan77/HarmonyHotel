import abilityTest from './Ability.test';
import loginPageTest from './LoginPage.test';
import homePageTest from './HomePage.test';
import lightPageTest from './LightPage.test';

export default function testsuite(): void {
  abilityTest();
  loginPageTest();
  homePageTest();
  lightPageTest();
}
