/******************************************************************************

	Mesh link.

    Instead of having source and destination fields as it usually has place
    for edges, we store two records for outgoing (@see type == '>') and
    outgoing (@see type == '<') connections. Also direct parent-child
    is available (@see type == 'V').

 ******************************************************************************/
CREATE TABLE mesh.link (
    id mesh.id NOT NULL,

    node mesh.id NOT NULL,

    type mesh.linktype
);

ALTER TABLE
    mesh.link
ADD CONSTRAINT
    PK_mesh_link
PRIMARY KEY (
    id,
    type
);

ALTER TABLE
    mesh.link
ADD CONSTRAINT
    FK_mesh_link_id
FOREIGN KEY (
    id
) REFERENCES mesh.node (
    id
);

ALTER TABLE
    mesh.link
ADD CONSTRAINT
    FK_mesh_link_node
FOREIGN KEY (
    id
) REFERENCES mesh.node (
    id
);

CREATE INDEX
    IX_mesh_link_node
ON mesh.link (
    node,
    type
);
