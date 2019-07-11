/*
  This aspect implies that we can reference entity it's applied
  to by its name.

  @statement {id} as known as {name}.
*/
CREATE TABLE content.name (
  id mesh.id NOT NULL,
    CONSTRAINT pk_content_name PRIMARY KEY (id),
    CONSTRAINT fk_content_name_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

  name text NOT NULL
) WITHOUT OIDS ;
