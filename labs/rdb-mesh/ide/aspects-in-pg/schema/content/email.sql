/*
  E-mail representation aspect.

  @statement {id} as e-mail is {blob}.
*/
CREATE TABLE content.email (
  id mesh.id NOT NULL,
    CONSTRAINT pk_content_email PRIMARY KEY (id),
    CONSTRAINT fk_content_email_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

  subject text NOT NULL,
  content text NOT NULL,
  sender text NOT NULL,
  recipients text[] NOT NULL,
  cc text[],
  bcc text[]
) WITHOUT OIDS ;
