type Callback = (...args: ESObject[]) => void;

class EventBus {
  private listeners: Map<string, Callback[]> = new Map();

  on(event: string, callback: Callback): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, []);
    }
    this.listeners.get(event)!.push(callback);
  }

  emit(event: string, ...args: ESObject[]): void {
    const cbs: Callback[] | undefined = this.listeners.get(event);
    if (cbs) {
      cbs.forEach((cb: Callback) => cb(...args));
    }
  }
}

export const eventBus: EventBus = new EventBus();
