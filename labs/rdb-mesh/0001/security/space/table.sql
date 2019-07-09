/*
    Security space.

    Defines isolated environment. User may have multiple and switch between
    them.

*/
CREATE TABLE security.space (
    id mesh.id NOT NULL,
        CONSTRAINT pk_security_space PRIMARY KEY(id),
        CONSTRAINT fk_security_space_id FOREIGN KEY (id) REFERENCES mesh.entity(id)
) WITHOUT OIDS;
