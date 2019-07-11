import { ID, IEntity } from "./entity";

/**

    This aspect defines that entity points to another entity.

    @statement {id} points to {to}
    @aspect point

 */
export interface IPoint extends IEntity {
    to: ID;
}
