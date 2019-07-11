/*
  Relation between two particular entities.

  @statement {id} relates to {target} as {relation}.
*/
CREATE TABLE mesh.link (
  id mesh.id NOT NULL,
    CONSTRAINT pk_mesh_link PRIMARY KEY(id),
    CONSTRAINT fk_mesh_link_id FOREIGN KEY(id) REFERENCES mesh.entity(id),

  -- Link is between id and this target.
  target mesh.id NOT NULL,
    CONSTRAINT fk_mesh_link_target FOREIGN KEY(target) REFERENCES mesh.entity(id),

  -- Any entity can be a relation, but mesh.relation expected to
  -- be used pretty frequently.
  relation mesh.id NULL,
    CONSTRAINT fk_mesh_link_relation FOREIGN KEY(relation) REFERENCES mesh.entity(id)

) WITHOUT OIDS;
