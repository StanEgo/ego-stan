/*
  Relation as a type of link between entities.
*/
CREATE TABLE mesh.relation (
  id mesh.id NOT NULL,
    CONSTRAINT pk_mesh_relation PRIMARY KEY(id)
) WITHOUT OIDS;
