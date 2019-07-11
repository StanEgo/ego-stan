/*
  "If two things or ideas mesh or are meshed, they go together well or fit
  together closely." (c) Collins dictionary.

  Mesh schema is responsible for well organization of thoughts.
*/
CREATE SCHEMA mesh;

CREATE DOMAIN mesh.id AS text;

\i schema/mesh/entity.sql
\i schema/mesh/relation.sql
\i schema/mesh/link.sql
\i schema/mesh/link_query.sql
