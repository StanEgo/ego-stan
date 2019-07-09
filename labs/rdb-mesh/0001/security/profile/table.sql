/*
    Security profile.

    Defines isolated environment. User may have multiple and switch between
    them.

*/
CREATE TABLE security.profile (
    id mesh.id NOT NULL,
        CONSTRAINT pk_security_profile PRIMARY KEY(id),
        CONSTRAINT fk_security_profile_id FOREIGN KEY (id) REFERENCES mesh.entity(id)
) WITHOUT OIDS;
