/*
  Authentication based on password.
*/
CREATE TABLE security.password (
  id mesh.id NOT NULL,
    CONSTRAINT pk_security_password PRIMARY KEY(id),
    CONSTRAINT fk_security_password_id FOREIGN KEY (id) REFERENCES mesh.link(id),

  hash bytea NOT NULL
) WITHOUT OIDS;
