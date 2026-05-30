import { ApiResponse, mockGetRoomState, mockSetLightMode } from '@ohos/network';
import { RoomState, Light, LightMode, RoomServiceState, roomServiceState } from '@ohos/datastore';

let instance: LightViewModel | null = null;

export function getLightViewModel(): LightViewModel {
  if (!instance) {
    instance = new LightViewModel();
  }
  return instance;
}

@ObservedV2
export class LightViewModel {
  @Trace isLoading: boolean = false;
  store: RoomServiceState = roomServiceState;

  get mainSwitchOn(): boolean {
    return this.store.lights.length > 0 && this.store.lights.every((l: Light) => l.on);
  }

  getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;
  setLightModeApi: (hardwareId: number) => Promise<ApiResponse<string>> = mockSetLightMode;

  private loaded: boolean = false;

  async loadLights(): Promise<void> {
    if (this.loaded) return;
    this.isLoading = true;
    const res: ApiResponse<RoomState> = await this.getRoomStateApi('2002');
    if (res.success && res.data) {
      this.store.lightModes = res.data.hardware.lightModes;
      this.store.lights = res.data.hardware.lights.map((l: Light) => new Light(l.cpadd, l.name, l.location, l.id, true));
      this.loaded = true;
    }
    this.isLoading = false;
  }

  async setAllLights(on: boolean): Promise<void> {
    const hardwareId: number = on ? 103001 : 103004;
    const res: ApiResponse<string> = await this.setLightModeApi(hardwareId);
    if (res.success) {
      this.store.setAllLights(on);
    }
  }

  async setSceneMode(modeId: number, modeName: string): Promise<void> {
    const res: ApiResponse<string> = await this.setLightModeApi(modeId);
    if (res.success) {
      this.store.setSceneMode(modeId, modeName);
    }
  }

  toggleLight(index: number): void {
    this.store.toggleLight(index);
  }
}
