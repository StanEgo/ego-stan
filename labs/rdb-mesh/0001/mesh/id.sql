/******************************************************************************

	Distribute identifier.

    Can handle 4096 shards, each capable of processing 1M transactions per
    second. Structure of 64-bit is value:
    
    32 bits
    Like UNIX timestamp (number of seconds from 1970-01-01), but from "epoch"
    value configured in @see env.vars.

    12 bits
    Shard code. Stored in "shard" value of @see env.vars.

    20 bits
    Sequence counter.
	
 ******************************************************************************/
CREATE DOMAIN
    "mesh"."id"
AS
    bigint
;
