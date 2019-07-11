import { ID, IEntity } from "./entity";

/**

    This aspect defines that entity is a part of another one entity.

    @statement {id} is part of {of}
    @aspect part

 */
export interface IPart extends IEntity {
    of: ID;
}
