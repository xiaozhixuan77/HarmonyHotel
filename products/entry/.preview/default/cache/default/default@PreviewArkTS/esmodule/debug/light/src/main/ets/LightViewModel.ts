import type { ApiResponse } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import type { RoomState, Light, LightMode } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { mockGetRoomState } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { mockSetLightMode } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
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
    @Trace
    lights: Light[] = [];
    @Trace
    lightModes: LightMode[] = [];
    @Trace
    isLoading: boolean = false;
    @Trace
    currentSceneMode: string = '';
    get mainSwitchOn(): boolean {
        return this.lights.length > 0 && this.lights.every((l: Light) => l.on);
    }
    getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;
    setLightModeApi: (hardwareId: number) => Promise<ApiResponse<string>> = mockSetLightMode;
    async loadLights(): Promise<void> {
        this.isLoading = true;
        const res: ApiResponse<RoomState> = await this.getRoomStateApi('2002');
        if (res.success && res.data) {
            this.lights = res.data.hardware.lights.map((l: Light) => cloneLight(l, true));
            this.lightModes = res.data.hardware.lightModes;
        }
        this.isLoading = false;
    }
    async setAllLights(on: boolean): Promise<void> {
        const hardwareId: number = on ? 103001 : 103004;
        const res: ApiResponse<string> = await this.setLightModeApi(hardwareId);
        if (res.success) {
            this.lights = this.lights.map((l: Light) => cloneLight(l, on));
            this.currentSceneMode = '';
        }
    }
    async setSceneMode(modeId: number, modeName: string): Promise<void> {
        const res: ApiResponse<string> = await this.setLightModeApi(modeId);
        if (res.success) {
            this.currentSceneMode = modeName;
            const allOn: boolean = modeId !== 103004 && modeId !== 103123;
            this.lights = this.lights.map((l: Light) => cloneLight(l, allOn));
        }
    }
    toggleLight(index: number): void {
        if (index < 0 || index >= this.lights.length) {
            return;
        }
        const updated: Light[] = this.lights.slice();
        updated[index] = cloneLight(updated[index], !updated[index].on);
        this.lights = updated;
    }
}
