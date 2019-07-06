/******************************************************************************

	Generate @see mesh.id.
	
 ******************************************************************************/
CREATE FUNCTION mesh.id_new()
RETURNS mesh.id
AS $BODY$
    SELECT
        (
            (EXTRACT(EPOCH FROM (NOW() - epoch)::INTERVAL)::bigint << 32)
            + (shard::bigint << 20)
            + NEXTVAL('mesh.id_sequence')
        )::mesh.id
    FROM
        env.vars
    ;
$BODY$
LANGUAGE SQL;
