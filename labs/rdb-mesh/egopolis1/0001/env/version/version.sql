/***************************************************************************************************

	Database versions sequence

 ***************************************************************************************************/
DO $VERSION$
BEGIN
	CREATE SEQUENCE
		env.version
	START WITH
		1
	INCREMENT BY
		1
	;
EXCEPTION
	WHEN duplicate_table THEN RETURN;	
END
$VERSION$ LANGUAGE plpgsql;
