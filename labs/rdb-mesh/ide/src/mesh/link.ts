import { IPart } from "./part";
import { IPoint } from './point';

/**

    This is a virtual apsect produced by combination of @see IPart and
    @see IPoint. The entity implementing this aspect is a part of
    some source object and points to another. So works like an aggregate.

    @statement {of} is linked with {to} as {id}

 */
export interface ILink extends IPart, IPoint {
    
}
