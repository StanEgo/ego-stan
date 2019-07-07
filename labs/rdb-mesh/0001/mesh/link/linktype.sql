/******************************************************************************

	Type of the @see link.

    Link can be outgoing ('>'), incoming ('>') or pointing to child ('V').

 ******************************************************************************/
CREATE DOMAIN
    mesh.linktype
AS
    char
COLLATE
    "C"
NOT NULL
CHECK (
    VALUE IN ('>', '<', 'V')
);
