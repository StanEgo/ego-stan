-- Person --------------------------------------------------------------------
CREATE TABLE social.person (
  id mesh.id NOT NULL,
    CONSTRAINT pk_social_person PRIMARY KEY(id),
    CONSTRAINT fk_social_person_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

  firstName text,
  lastName text
) WITHOUT OIDS ;
