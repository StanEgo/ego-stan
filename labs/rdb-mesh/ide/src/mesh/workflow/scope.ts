import { IEntity } from "../entity";
import { IName } from "../name";
import { IPart } from "../part";

/**
 * Scope.
 *
 * @aspect scope
 */
export interface IScope extends IEntity, IName, IPart {}

// TODO: use @ts-ignore and rule for I Interface prefix.
