CREATE OR REPLACE VIEW mesh.node_view_brief
AS SELECT
    id,
    prototype,
    title
FROM
    mesh.node
;
