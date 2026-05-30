import { ApiResponse, mockGetRoomState, mockClickAirBtn, mockSetLightMode } from '@ohos/network';
import { RoomState, RoomServiceState, roomServiceState, Light } from '@ohos/datastore';

const AC_ID = 103136;
const DEBOUNCE_DELAY = 500;

let instance: HomeViewModel | null = null;

export function getHomeViewModel(): HomeViewModel {
  if (!instance) {
    instance = new HomeViewModel();
  }
  return instance;
}

@ObservedV2
export class HomeViewModel {
  @Trace roomNumber: string = '2002';
  @Trace hotelName: string = '';
  @Trace settingTemp: number = 22;
  @Trace currentTemp: number = 19;
  @Trace acMode: number = 0;
  @Trace acSpeed: number = 1;
  @Trace acPower: boolean = true;
  @Trace isLoading: boolean = false;
  serviceState: RoomServiceState = roomServiceState;

  getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;
  clickAirBtnApi: (cmd: string, value: number, airId: number) => Promise<ApiResponse<string>> = mockClickAirBtn;
  setLightModeApi: (hardwareId: number) => Promise<ApiResponse<string>> = mockSetLightMode;

  private loaded: boolean = false;
  private tempDebounceTimer: number | undefined;

  async loadRoomState(): Promise<void> {
    if (this.loaded) return;
    this.isLoading = true;
    const res: ApiResponse<RoomState> = await this.getRoomStateApi(this.roomNumber);
    if (res.success && res.data) {
      const data: RoomState = res.data;
      this.hotelName = data.hotel_name;
      const ac = data.hardware.airs[0];
      if (ac) {
        this.settingTemp = ac.settingTemp || 22;
        this.currentTemp = ac.currentTemp || 19;
        this.acMode = ac.mode || 0;
        this.acSpeed = ac.speed || 1;
        this.acPower = (ac.open || 0) === 1;
      }
      this.serviceState.dndOn = data.state.wurao === '1';
      this.serviceState.cleanRequested = data.state.qingli === '1';
      if (this.serviceState.lights.length === 0) {
        this.serviceState.lightModes = data.hardware.lightModes;
        this.serviceState.lights = data.hardware.lights.map((l: Light) => new Light(l.cpadd, l.name, l.location, l.id, true));
      }
      this.loaded = true;
    }
    this.isLoading = false;
  }

  tempUp(): void {
    if (this.settingTemp >= 30) {
      return;
    }
    this.settingTemp++;
    this.debounceSetTemp(this.settingTemp);
  }

  tempDown(): void {
    if (this.settingTemp <= 16) {
      return;
    }
    this.settingTemp--;
    this.debounceSetTemp(this.settingTemp);
  }

  async togglePower(): Promise<void> {
    const value: number = this.acPower ? 0 : 1;
    const res: ApiResponse<string> = await this.clickAirBtnApi('power', value, AC_ID);
    if (res.success) {
      this.acPower = !this.acPower;
    }
  }

  async setSceneMode(hardwareId: number, modeName: string): Promise<void> {
    const res: ApiResponse<string> = await this.setLightModeApi(hardwareId);
    if (res.success) {
      this.serviceState.setSceneMode(hardwareId, modeName);
    }
  }

  async goodNightMode(): Promise<void> {
    const res: ApiResponse<string> = await this.setLightModeApi(103004);
    if (res.success) {
      this.serviceState.setSceneMode(103004, '晚安');
    }
  }

  toggleDND(): void {
    this.serviceState.dndOn = !this.serviceState.dndOn;
  }

  toggleClean(): void {
    this.serviceState.cleanRequested = !this.serviceState.cleanRequested;
  }

  private debounceSetTemp(temp: number): void {
    if (this.tempDebounceTimer !== undefined) {
      clearTimeout(this.tempDebounceTimer);
    }
    this.tempDebounceTimer = setTimeout(async () => {
      await this.clickAirBtnApi('temp', temp, AC_ID);
      this.tempDebounceTimer = undefined;
    }, DEBOUNCE_DELAY);
  }
}
