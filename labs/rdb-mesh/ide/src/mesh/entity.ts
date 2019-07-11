export type ID = string;

/**

    An entity is something that exists separately from other things.

    @remarks
    Anything in the Mesh is an entity. Compared to many other implementations
    (relational model, graphs, etc) all nodes and links are also entities.

    "An entity is something that exists separately from other things and has a
    clear identity of its own." (c) Collins dictionary

    @statement There is an {id}.

*/
export interface IEntity {
    /**
        Abstract entity identifier.

        @remarks
        Entity by its defintion can be considered separately from other things.
        So we can exclude any aspects from it. E.g. if "person" entity has names
        and phone number defined, virtually we can remove them one-by-one and
        get this person as a pure abstraction. The only thing that helps us to
        understand that we're talking about this particular entity is its
        surrogate identifier.

        @auto
    */
    id: ID;
}
