CREATE FUNCTION mesh.id_new ()
RETURNS mesh.id
AS $BODY$
    --TASK:
    SELECT 0::mesh.id
$BODY$
LANGUAGE SQL;
