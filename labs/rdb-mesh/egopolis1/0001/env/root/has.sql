/***************************************************************************************************

	Check that there is an environment variable with selected values
	
	@param name
	Name of the variable checked
	
	@param value
	Value to check the variable for.
	
	@returns
	Returns true if environment variable has selected value

 ***************************************************************************************************/
CREATE OR REPLACE FUNCTION env.has(name varchar(32), value text)
RETURNS boolean
AS $$
	SELECT EXISTS(
		SELECT
			*
		FROM
			env.list
		WHERE
			list.name = has.name
			AND list.value = has.value
	);
$$ LANGUAGE sql;

/***************************************************************************************************

	Check that there is an environment variable with value '1'
	
	@param name
	Name of the variable checked

	@returns
	Returns true if environment variable has value '1'

 ***************************************************************************************************/
CREATE OR REPLACE FUNCTION env.has(name varchar(32))
RETURNS boolean
AS $$
	SELECT env.has(name, '1');
$$ LANGUAGE sql;
