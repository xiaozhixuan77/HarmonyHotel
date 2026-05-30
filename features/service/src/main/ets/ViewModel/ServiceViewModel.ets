import { ApiResponse, mockGetRoomState, clearToken } from '@ohos/network';
import { RoomState, Service, RoomServiceState, roomServiceState } from '@ohos/datastore';
import { deleteToken, clearLoginInfo } from '@ohos/datastore';
import { common } from '@kit.AbilityKit';

function cloneService(s: Service, active: boolean): Service {
  return {
    code: s.code,
    name: s.name,
    id: s.id,
    active: active
  };
}

let instance: ServiceViewModel | null = null;

export function getServiceViewModel(): ServiceViewModel {
  if (!instance) {
    instance = new ServiceViewModel();
  }
  return instance;
}

@ObservedV2
export class ServiceViewModel {
  @Trace services: Service[] = [];
  @Trace sosTriggered: boolean = false;
  @Trace isLoading: boolean = false;
  serviceState: RoomServiceState = roomServiceState;

  getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;

  private loaded: boolean = false;

  async loadServices(): Promise<void> {
    if (this.loaded) return;
    this.isLoading = true;
    const res: ApiResponse<RoomState> = await this.getRoomStateApi('2002');
    if (res.success && res.data) {
      this.services = res.data.hardware.services.map((s: Service) => cloneService(s, false));
      this.serviceState.dndOn = res.data.state.wurao === '1';
      this.serviceState.cleanRequested = res.data.state.qingli === '1';
      this.loaded = true;
    }
    this.isLoading = false;
  }

  toggleDND(): void {
    this.serviceState.dndOn = !this.serviceState.dndOn;
  }

  requestClean(): void {
    this.serviceState.cleanRequested = true;
  }

  cancelClean(): void {
    this.serviceState.cleanRequested = false;
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
