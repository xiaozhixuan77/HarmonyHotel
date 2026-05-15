export interface TabItemConfig {
    label: string;
    selectedIcon: Resource;
    unselectedIcon: Resource;
}
export const HOME_TAB: TabItemConfig = {
    label: '首页',
    selectedIcon: { "id": 50331656, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
    unselectedIcon: { "id": 50331661, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }
};
export const LIGHT_TAB: TabItemConfig = {
    label: '灯光',
    selectedIcon: { "id": 50331660, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
    unselectedIcon: { "id": 50331657, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }
};
export const CURTAIN_TAB: TabItemConfig = {
    label: '窗帘',
    selectedIcon: { "id": 50331655, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
    unselectedIcon: { "id": 50331694, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }
};
export const SERVICE_TAB: TabItemConfig = {
    label: '服务',
    selectedIcon: { "id": 50331652, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" },
    unselectedIcon: { "id": 50331653, "type": 20000, params: [], "bundleName": "com.example.honysystem", "moduleName": "entry" }
};
export const TAB_CONFIGS: TabItemConfig[] = [HOME_TAB, LIGHT_TAB, CURTAIN_TAB, SERVICE_TAB];
