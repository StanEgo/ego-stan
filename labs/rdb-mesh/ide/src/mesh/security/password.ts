import { IEntity } from "../entity";
import { ILink } from "../link";

/**
 * Password.
 *
 * @aspect password
 */
export interface IPassword extends IEntity, ILink {
  hash: string;
}
