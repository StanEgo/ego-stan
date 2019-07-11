CREATE TABLE mesh.node (
    id text NOT NULL PRIMARY KEY,
    prototype text NOT NULL REFERENCES mesh.prototype(id),
    title text NOT NULL,
    data xml NOT NULL,
    created timestamp NOT NULL
);
