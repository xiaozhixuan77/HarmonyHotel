import abilityTest from './Ability.test';
import loginPageTest from './LoginPage.test';
import homePageTest from './HomePage.test';
import lightPageTest from './LightPage.test';
import curtainPageTest from './CurtainPage.test';
import servicePageTest from './ServicePage.test';

export default function testsuite(): void {
  abilityTest();
  loginPageTest();
  homePageTest();
  lightPageTest();
  curtainPageTest();
  servicePageTest();
}
