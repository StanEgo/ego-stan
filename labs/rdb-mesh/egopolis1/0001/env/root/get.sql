/***************************************************************************************************

	Get the value of the environment variable
	
	@param name
	Name of the variable to get the value for
	
	@returns
	Returns environment variable value

 ***************************************************************************************************/
CREATE OR REPLACE FUNCTION env.get(name varchar(32))
RETURNS text
AS $$
	SELECT value FROM env.list WHERE list.name = get.name;
$$ LANGUAGE sql;
