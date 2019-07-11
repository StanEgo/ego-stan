import {IEntity} from "../entity";

/**
 * User.
 * 
 * @aspect user
 */
export interface IUser extends IEntity {
    // TODO: IName.name
    login: string;
}
