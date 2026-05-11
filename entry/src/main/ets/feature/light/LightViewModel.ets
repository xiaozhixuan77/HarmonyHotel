import { ApiResponse } from '../../common/model/ApiResponse';
import { RoomState, Light, LightMode } from '../../common/model/DeviceModels';
import { mockGetRoomState } from '../../common/mock/MockRoomState';
import { mockSetLightMode } from '../../common/mock/MockLight';

function cloneLight(light: Light, on: boolean): Light {
  return {
    cpadd: light.cpadd,
    name: light.name,
    location: light.location,
    id: light.id,
    on: on
  };
}

@ObservedV2
export class LightViewModel {
  @Trace lights: Light[] = [];
  @Trace lightModes: LightMode[] = [];
  @Trace isLoading: boolean = false;
  @Trace currentSceneMode: string = '';
  @Trace mainSwitchOn: boolean = false;

  getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;
  setLightModeApi: (hardwareId: number) => Promise<ApiResponse<string>> = mockSetLightMode;

  async loadLights(): Promise<void> {
    this.isLoading = true;
    const res: ApiResponse<RoomState> = await this.getRoomStateApi('2002');
    if (res.success && res.data) {
      this.lights = res.data.hardware.lights.map((l: Light) => cloneLight(l, true));
      this.lightModes = res.data.hardware.lightModes;
      this.updateMainSwitchState();
    }
    this.isLoading = false;
  }

  async setAllLights(on: boolean): Promise<void> {
    const hardwareId: number = on ? 103001 : 103004;
    const res: ApiResponse<string> = await this.setLightModeApi(hardwareId);
    if (res.success) {
      this.lights = this.lights.map((l: Light) => cloneLight(l, on));
      this.updateMainSwitchState();
      this.currentSceneMode = '';
    }
  }

  async setSceneMode(modeId: number, modeName: string): Promise<void> {
    const res: ApiResponse<string> = await this.setLightModeApi(modeId);
    if (res.success) {
      this.currentSceneMode = modeName;
      this.lights = this.lights.map((l: Light) => cloneLight(l, true));
      this.updateMainSwitchState();
    }
  }

  toggleLight(index: number): void {
    if (index < 0 || index >= this.lights.length) {
      return;
    }
    const updated: Light[] = this.lights.slice();
    updated[index] = cloneLight(updated[index], !updated[index].on);
    this.lights = updated;
    this.updateMainSwitchState();
  }

  private updateMainSwitchState(): void {
    this.mainSwitchOn = this.lights.length > 0 && this.lights.every((l: Light) => l.on);
  }
}
