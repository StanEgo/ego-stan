/******************************************************************************

	View all environment variables, those are passed to psql.exe call
	(e.g. --set=ENV_DEBUG=1) and other external sources.
	
 ******************************************************************************/
CREATE OR REPLACE VIEW env.vars
AS SELECT
	:ENV_DEBUG::boolean AS debug,
	:ENV_CLEAN::boolean AS clean,
	:ENV_SHARD::smallint AS shard,
	:ENV_EPOCH::timestamp AS epoch
;

CREATE OR REPLACE FUNCTION env.is_debug()
RETURNS boolean
AS $BODY$
	SELECT
		debug
	FROM
		env.vars
$BODY$
LANGUAGE SQL
IMMUTABLE;

CREATE OR REPLACE FUNCTION env.is_clean()
RETURNS boolean
AS $BODY$
	SELECT
		clean
	FROM
		env.vars
$BODY$
LANGUAGE SQL
IMMUTABLE;
