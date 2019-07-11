import {IEntity} from "../entity";

/**
 * An aspect that represents an Entity as a Text.
 * Probably without markup inside.
 * E.g., used for full-text searching.
 *
 * @aspect text
 */
export interface IText extends IEntity {
    text: string;
}
