// TODO: Merge sync/async implementations/interfaces?
import { IDisposableAsync } from ".";

export async function usingAsync<T extends IDisposableAsync>(resource: T, func: (resource: T) => Promise<void>) {
    try {
        await func(resource);
    } finally {
        await resource.dispose();
    }
}
