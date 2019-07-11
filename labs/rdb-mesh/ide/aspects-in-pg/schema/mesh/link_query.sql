/*
  Query SelectLink($target, $relation) {
    link(target: $target, relation: $relation) {...}
  }
 */
CREATE OR REPLACE FUNCTION mesh.link_query(
  target mesh.id,
  relation mesh.id
)
RETURNS
  SETOF mesh.link
AS $$ SELECT
  *
FROM
  mesh.link
WHERE
  target = 'user-stan'
  AND relation = 'relation-inbox'
$$ LANGUAGE SQL;
