/*
  Authentication based on X.509 certificate.

  TODO: This is a part of proof-of-concept to show multiple
  identification methods for the same user.
 */
CREATE TABLE security.x509 (
  id mesh.id NOT NULL,
    CONSTRAINT pk_security_x509 PRIMARY KEY(id),
    CONSTRAINT fk_security_x509_id FOREIGN KEY (id) REFERENCES mesh.link(id),

  -- TODO: For simplicity just a thumbprint temporarily here.
  thumbprint bytea NOT NULL
) WITHOUT OIDS;
