/******************************************************************************

	Mesh node.

 ******************************************************************************/
CREATE TABLE mesh.node (
    id mesh.id NOT NULL,

    created timestamp NOT NULL,

    deleted timestamp NULL
);

ALTER TABLE
    mesh.node
ADD CONSTRAINT
    PK_mesh_node
PRIMARY KEY (
    id
);
