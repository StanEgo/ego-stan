CREATE TABLE mesh.prototype (
    id smallserial NOT NULL,
    parent smallint NULL,
    name text NOT NULL
);

ALTER TABLE
    mesh.prototype
ADD CONSTRAINT
    PK_mesh_prototype
PRIMARY KEY (
    id
);

ALTER TABLE
    mesh.prototype
ADD CONSTRAINT
    FK_mesh_prototype_parent
FOREIGN KEY (
    parent
) REFERENCES mesh.prototype (
    id
);
