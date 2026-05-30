import { Light, LightMode } from './DeviceModels';

const PARTIAL_MODE_LIGHTS: Record<number, Set<string>> = {
  103120: new Set(['1', '15', '14']),
  103121: new Set(['11', '12', '13']),
  103122: new Set(['1', '15', '23', '14']),
};

@ObservedV2
export class RoomServiceState {
  @Trace dndOn: boolean = false;
  @Trace cleanRequested: boolean = false;
  @Trace sceneMode: string = '';
  @Trace lights: Light[] = [];
  @Trace lightModes: LightMode[] = [];

  setSceneMode(modeId: number, modeName: string): void {
    if (this.sceneMode === modeName) {
      this.sceneMode = '';
      return;
    }
    this.sceneMode = modeName;
    const onSet: Set<string> | undefined = PARTIAL_MODE_LIGHTS[modeId];
    if (onSet) {
      this.lights.forEach((l: Light) => { l.on = onSet.has(l.cpadd); });
    } else {
      const allOn: boolean = modeId !== 103004 && modeId !== 103123;
      this.lights.forEach((l: Light) => { l.on = allOn; });
    }
  }

  setAllLights(on: boolean): void {
    this.sceneMode = '';
    this.lights.forEach((l: Light) => { l.on = on; });
  }

  toggleLight(index: number): void {
    if (index < 0 || index >= this.lights.length) {
      return;
    }
    this.lights[index].on = !this.lights[index].on;
  }
}

export const roomServiceState: RoomServiceState = new RoomServiceState();
