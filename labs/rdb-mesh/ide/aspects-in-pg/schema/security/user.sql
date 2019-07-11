/*
  @statement {id} is identified in mesh as {login}
 */
CREATE TABLE security.user (
  id mesh.id NOT NULL,
    CONSTRAINT pk_security_user PRIMARY KEY(id),
    CONSTRAINT fk_security_user_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

  login text NOT NULL
) WITHOUT OIDS;

CREATE UNIQUE INDEX
  ux_security_user_login
ON security.user(
  login
);
