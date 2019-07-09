/*

    Security session.

    User or third-party system may create a session with the system.

*/
CREATE TABLE security.session (
    id mesh.id NOT NULL,
        CONSTRAINT pk_security_session PRIMARY KEY(id),
        CONSTRAINT fk_security_session_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

    uid bytea NOT NULL,

    space mesh.id NOT NULL,
        CONSTRAINT fk_security_session_space FOREIGN KEY (id) REFERENCES security.space(id)
) WITHOUT OIDS;
