/***************************************************************************************************

	Check that current environment is of selected version
	
	@param version
	Version to check the environment for
	
	@returns
	Returns true if current environment has selected version and false otherwise

 ***************************************************************************************************/
CREATE OR REPLACE FUNCTION env.version_is(version integer)
RETURNS boolean
AS $$
	SELECT
		version.last_value = version_is.version
	FROM
		env.version
	;
$$ LANGUAGE sql;
