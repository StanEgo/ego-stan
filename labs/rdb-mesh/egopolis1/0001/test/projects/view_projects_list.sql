CREATE OR REPLACE FUNCTION test.view_projects_list()
RETURNS
    SETOF mesh.node_view_brief
AS $$
    SELECT
        *
    FROM
        mesh.node_view_brief
    WHERE
        prototype = 'project'
$$ LANGUAGE SQL;
