/*
  Document representation aspect (document is text + markup).

  @statement {id} as document is {blob}.
*/
CREATE TABLE content.document (
  id mesh.id NOT NULL,
    CONSTRAINT pk_content_document PRIMARY KEY (id),
    CONSTRAINT fk_content_document_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

  context xml NOT NULL
) WITHOUT OIDS ;
