import type { ApiResponse } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import type { RoomState } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { mockGetRoomState } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { mockClickAirBtn } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { mockSetLightMode } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
const AC_ID = 103136;
const DEBOUNCE_DELAY = 500;
@ObservedV2
export class HomeViewModel {
    @Trace
    roomNumber: string = '2002';
    @Trace
    hotelName: string = '';
    @Trace
    settingTemp: number = 22;
    @Trace
    currentTemp: number = 19;
    @Trace
    acMode: number = 0;
    @Trace
    acSpeed: number = 1;
    @Trace
    acPower: boolean = true;
    @Trace
    isLoading: boolean = false;
    @Trace
    currentSceneMode: string = '';
    @Trace
    dndActive: boolean = false;
    @Trace
    cleanRequested: boolean = false;
    getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;
    clickAirBtnApi: (cmd: string, value: number, airId: number) => Promise<ApiResponse<string>> = mockClickAirBtn;
    setLightModeApi: (hardwareId: number) => Promise<ApiResponse<string>> = mockSetLightMode;
    private tempDebounceTimer: number | undefined;
    async loadRoomState(): Promise<void> {
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
            this.currentSceneMode = modeName;
        }
    }
    async goodNightMode(): Promise<void> {
        const res: ApiResponse<string> = await this.setLightModeApi(103004);
        if (res.success) {
            this.currentSceneMode = '晚安';
        }
    }
    toggleDND(): void {
        this.dndActive = !this.dndActive;
    }
    toggleClean(): void {
        this.cleanRequested = !this.cleanRequested;
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
