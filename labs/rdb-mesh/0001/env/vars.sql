/***************************************************************************************************

	View all environment variables, those are passed fro psql.exe call
	(e.g. --set=ENV_DEBUG=1) and other external sources.
	
 ***************************************************************************************************/
CREATE VIEW env.vars
AS SELECT
	:ENV_DEBUG::boolean AS debug,
	:ENV_CLEAN::boolean AS clean,
	:ENV_SHARD::smallint AS shard
;

CREATE FUNCTION env.is_debug()
RETURNS boolean
AS $BODY$
	SELECT
		debug
	FROM
		env.vars
$BODY$
LANGUAGE SQL
IMMUTABLE;

CREATE FUNCTION env.is_clean()
RETURNS boolean
AS $BODY$
	SELECT
		debug
	FROM
		env.vars
$BODY$
LANGUAGE SQL
IMMUTABLE;
