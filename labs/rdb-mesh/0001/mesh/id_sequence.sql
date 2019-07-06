/******************************************************************************

	Generate 20 bits cycling sequence number for @see id.
	
 ******************************************************************************/
CREATE SEQUENCE
    mesh.id_sequence
AS
    bigint
START WITH
    0
MiNVALUE
    0
MAXVALUE
    -- Maximum value for 20 bits (0xFFFFF)
    1048575
INCREMENT BY
    1
CYCLE
;
