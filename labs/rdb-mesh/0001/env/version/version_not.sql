/***************************************************************************************************

	Check that current environment is not of selected version
	
	@param version
	Version to check the environment for
	
	@returns
	Returns true if current environment has not selected version and false otherwise

 ***************************************************************************************************/
CREATE OR REPLACE FUNCTION env.version_not(version integer)
RETURNS boolean
AS $$
	SELECT
		version.last_value <> version_not.version
	FROM
		env.version
	;
$$ LANGUAGE sql;
