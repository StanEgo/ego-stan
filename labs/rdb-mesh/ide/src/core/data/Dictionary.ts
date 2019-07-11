export interface IDictionary<T> {
    [key: string]: T;
}

export class Dictionary<T> implements IDictionary<T> {
    [key: string]: T;

    static from<T>(array: T[], indexKey: keyof T): IDictionary<T> {
        const result: any = {}

        for (let i = 0; i < array.length; i++) {
             const key = array[i][indexKey]
             result[key] = array[i]
        }

        return result as { [key: string]: T }
    }
}
