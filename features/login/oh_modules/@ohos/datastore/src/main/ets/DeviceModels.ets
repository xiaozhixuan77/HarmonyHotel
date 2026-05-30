export interface AirConditioner {
  code: string;
  cpadd: string;
  name: string;
  location: string;
  id: number;
  settingTemp?: number;
  currentTemp?: number;
  mode?: number;
  speed?: number;
  open?: number;
}

@ObservedV2
export class Light {
  @Trace cpadd: string;
  @Trace name: string;
  @Trace location: string;
  @Trace id: number;
  @Trace on: boolean;

  constructor(cpadd: string, name: string, location: string, id: number, on: boolean) {
    this.cpadd = cpadd;
    this.name = name;
    this.location = location;
    this.id = id;
    this.on = on;
  }
}

export interface LightMode {
  cpadd: string;
  name: string;
  extra_name: string | null;
  location: string;
  id: number;
}

export type CurtainState = 'open' | 'close' | 'pause' | 'half';

export interface Curtain {
  sequence: number;
  cpadd: string;
  name: string;
  location: string;
  id: number;
  state?: CurtainState;
}

export interface Service {
  code: string;
  name: string;
  id: number;
  active?: boolean;
}

export interface StateFlags {
  qingli: string;
  wurao: string;
  sos: string;
  light_mode_1: string;
  light_mode_2: string;
  light_mode_3: string;
  light_mode_4: string;
  light_mode_5: string;
  light_mode_6: string;
  shaohou: string;
  tui: string;
  menci: string;
  ruzhu: string;
}

export interface Hardware {
  airs: AirConditioner[];
  curtains: Curtain[];
  lights: Light[];
  lightModes: LightMode[];
  services: Service[];
  tvs: Object[];
  brightness: Object[];
  hasBrightness: boolean;
  hasTv: boolean;
}

export interface RoomState {
  room_number: string;
  hotel_name: string;
  hasBidaMachine: boolean;
  hasCurtain: boolean;
  hasElectricityStatistic: boolean;
  state: StateFlags;
  hardware: Hardware;
}
