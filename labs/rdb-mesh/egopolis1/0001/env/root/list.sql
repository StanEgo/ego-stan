/***************************************************************************************************

	View all environment variables, those are passed fro psql.exe call
	(e.g. --set=ENV_DEBUG=1) and other external sources.
	
 ***************************************************************************************************/
CREATE OR REPLACE VIEW env.list
AS
	SELECT 'debug'::varchar(32) AS name, :ENV_DEBUG::text AS value
	UNION ALL SELECT 'clean', :ENV_CLEAN::text
;
