import {IEntity} from "../entity";

/**
 * An Entity containing a Person.
 *
 * @aspect person
 */
export interface IPerson extends IEntity {
    firstName?: string;
    lastName?: string;
}
