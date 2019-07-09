/*

    Security session.

    User or third-party system may create a session with the system.

*/
CREATE TABLE security.session (
    id mesh.id NOT NULL,
        CONSTRAINT pk_security_session PRIMARY KEY(id),
        CONSTRAINT fk_security_session_id FOREIGN KEY (id) REFERENCES mesh.entity(id),

    uid bytea NOT NULL,

    profile mesh.id NOT NULL,
        CONSTRAINT fk_security_session_profile FOREIGN KEY (id) REFERENCES security.profile(id)
) WITHOUT OIDS;
