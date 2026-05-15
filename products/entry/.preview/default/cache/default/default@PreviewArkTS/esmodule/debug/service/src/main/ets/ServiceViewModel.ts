import type { ApiResponse } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import type { RoomState, Service } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { mockGetRoomState } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { deleteToken, clearLoginInfo } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import { clearToken } from "@normalized:N&&&@ohos/common/src/main/ets/Index&1.0.0";
import type common from "@ohos:app.ability.common";
function cloneService(s: Service, active: boolean): Service {
    return {
        code: s.code,
        name: s.name,
        id: s.id,
        active: active
    };
}
@ObservedV2
export class ServiceViewModel {
    @Trace
    services: Service[] = [];
    @Trace
    dndOn: boolean = false;
    @Trace
    cleanRequested: boolean = false;
    @Trace
    sosTriggered: boolean = false;
    @Trace
    isLoading: boolean = false;
    getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;
    async loadServices(): Promise<void> {
        this.isLoading = true;
        const res: ApiResponse<RoomState> = await this.getRoomStateApi('2002');
        if (res.success && res.data) {
            this.services = res.data.hardware.services.map((s: Service) => cloneService(s, false));
            this.dndOn = res.data.state.wurao === '1';
            this.cleanRequested = res.data.state.qingli === '1';
        }
        this.isLoading = false;
    }
    toggleDND(): void {
        this.dndOn = !this.dndOn;
    }
    requestClean(): void {
        this.cleanRequested = true;
    }
    cancelClean(): void {
        this.cleanRequested = false;
    }
    triggerSOS(): void {
        this.sosTriggered = true;
    }
    async logout(context: common.Context): Promise<void> {
        await deleteToken(context);
        await clearLoginInfo(context);
        clearToken();
    }
}
