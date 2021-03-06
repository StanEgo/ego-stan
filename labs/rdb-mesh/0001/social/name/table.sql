/*
    Social name aspect.
*/
CREATE TABLE social.name (
    id mesh.id NOT NULL,
        CONSTRAINT pk_social_name PRIMARY KEY(id),
        CONSTRAINT fk_social_name_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

    first text,
    last text,
    middle text
) WITHOUT OIDS;