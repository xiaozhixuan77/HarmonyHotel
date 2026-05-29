export interface TabItemConfig {
  label: string;
  selectedIcon: Resource;
  unselectedIcon: Resource;
}

export const HOME_TAB: TabItemConfig = {
  label: '首页',
  selectedIcon: $r('app.media.tabs_icon_home_select'),
  unselectedIcon: $r('app.media.tabs_icon_home_unselect')
};

export const LIGHT_TAB: TabItemConfig = {
  label: '灯光',
  selectedIcon: $r('app.media.tabs_icon_light_select'),
  unselectedIcon: $r('app.media.tabs_icon_light_unselect')
};

export const CURTAIN_TAB: TabItemConfig = {
  label: '窗帘',
  selectedIcon: $r('app.media.tabs_icon_curtain_select'),
  unselectedIcon: $r('app.media.tabs_icon_curtain_unselect')
};

export const SERVICE_TAB: TabItemConfig = {
  label: '服务',
  selectedIcon: $r('app.media.tabs_icon_service_select'),
  unselectedIcon: $r('app.media.tabs_icon_service_unselect')
};

export const TAB_CONFIGS: TabItemConfig[] = [HOME_TAB, LIGHT_TAB, CURTAIN_TAB, SERVICE_TAB];
