import { ApiResponse } from '../../common/model/ApiResponse';
import { RoomState, Curtain, CurtainState } from '../../common/model/DeviceModels';
import { mockGetRoomState } from '../../common/mock/MockRoomState';

function cloneCurtain(c: Curtain, state: CurtainState): Curtain {
  return {
    sequence: c.sequence,
    cpadd: c.cpadd,
    name: c.name,
    location: c.location,
    id: c.id,
    state: state
  };
}

@ObservedV2
export class CurtainViewModel {
  @Trace curtains: Curtain[] = [];
  @Trace isLoading: boolean = false;

  getRoomStateApi: (roomNo: string) => Promise<ApiResponse<RoomState>> = mockGetRoomState;

  async loadCurtains(): Promise<void> {
    this.isLoading = true;
    const res: ApiResponse<RoomState> = await this.getRoomStateApi('2002');
    if (res.success && res.data) {
      this.curtains = res.data.hardware.curtains.map((c: Curtain) => cloneCurtain(c, 'close'));
    }
    this.isLoading = false;
  }

  setAll(state: CurtainState): void {
    this.curtains = this.curtains.map((c: Curtain) => cloneCurtain(c, state));
  }

  setCurtainState(index: number, state: CurtainState): void {
    if (index < 0 || index >= this.curtains.length) {
      return;
    }
    const updated: Curtain[] = this.curtains.slice();
    updated[index] = cloneCurtain(updated[index], state);
    this.curtains = updated;
  }
}
