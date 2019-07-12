/*
    Entity is a basic "atom" of the Mesh. Anything in the Mesh is an entity.

    "An entity is something that exists separately from other things and has a
    clear identity of its own." (c) Collins dictionary

    @statement {id} is an {entity}.
 */
CREATE TABLE mesh.entity (
    id mesh.id NOT NULL DEFAULT mesh.id_new(),
        CONSTRAINT pk_mesh_entity PRIMARY KEY(id),

	-- Natural name of the entity. Probably a temporary field for convenience.
	name text NULL,

	owner mesh.id NULL,
		CONSTRAINT
			fk_mesh_entity_owner
		FOREIGN KEY(
			owner
		) REFERENCES mesh.entity(
			id
		)

	-- TODO: This fields may be a part of lifetime aspect.
    -- created timestamp NOT NULL,
    -- deleted timestamp NULL
) WITHOUT OIDS;

CREATE UNIQUE INDEX
	ux_mesh_entity_name
ON mesh.entity (
	name
)
WHERE
	name IS NOT NULL
;