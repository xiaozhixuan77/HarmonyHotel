export function debounce<T extends Object[]>(fn: (...args: T) => void, delay: number): (...args: T) => void {
    let timer: number | undefined;
    return (...args: T) => {
        if (timer !== undefined) {
            clearTimeout(timer);
        }
        timer = setTimeout(() => {
            fn(...args);
            timer = undefined;
        }, delay);
    };
}
