/*
  File representation aspect.

  @statement {id} as file is {blob}.
*/
CREATE TABLE content.file (
  id mesh.id NOT NULL,
    CONSTRAINT pk_content_file PRIMARY KEY (id),
    CONSTRAINT fk_content_file_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

  blob bytea NOT NULL,
  mimeType text NULL
) WITHOUT OIDS ;
