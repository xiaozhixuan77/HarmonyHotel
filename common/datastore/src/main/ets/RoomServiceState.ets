@ObservedV2
export class RoomServiceState {
  @Trace dndOn: boolean = false;
  @Trace cleanRequested: boolean = false;
}

export const roomServiceState: RoomServiceState = new RoomServiceState();
