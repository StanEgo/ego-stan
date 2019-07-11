CREATE TABLE mesh.prototype (
    id text NOT NULL PRIMARY KEY,
    parent text NULL REFERENCES mesh.prototype(id),
    description text NOT NULL
);
