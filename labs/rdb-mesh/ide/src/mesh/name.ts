import { IEntity } from "./entity";

/**
 * Any named Entity.
 *
 * @aspect name
 */
export interface IName extends IEntity {
    name: string;
}
