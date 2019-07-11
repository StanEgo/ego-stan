CREATE TABLE temp.body_stats (
    id serial,
    recorded date,
    weight decimal,
    fat decimal,
    bones_weight decimal,
    fat_visceral decimal
);

INSERT INTO temp.body_stats (
    recorded,
    weight,    
    fat,
    bones_weight,
    fat_visceral
) VALUES
( '2016-10-04', 99.4, 19.3, 3.9, 6.0 ),
( '2016-10-05', 98.9, 19.3, 3.9, 6.0 ),
( '2016-10-06', 99.0, 18.0, 4.0, 6.0 ),
( '2016-10-07', 98.3, 18.3, 3.9, 6.0 ),
( '2016-10-08', 100.5, 19.0, 4.0, 6.0 ),
( '2016-10-09', 100.2, 17.0, 4.1, 6.0 ),

( '2016-10-10', 99.9, 18.2, 4.0, 6.0 ),
( '2016-10-11', 98.2, 18.6, 3.9, 6.0 ),
( '2016-10-12', 97.1, 19.4, 3.8, 6.0 ),
( '2016-10-13', 96.6, 18.7, 3.9, 6.0 ),
( '2016-10-14', 96.9, 18.4, 3.9, 6.0 ),
( '2016-10-15', 97.9, 18.6, 3.9, 6.0 ),
( '2016-10-16', 99.0, 16.5, 4.0, 5.0 ),

( '2016-10-17', 99.3, 16.4, 4.1, 5.0 ),
( '2016-10-18', 97.7, 17.3, 4.0, 6.0 ),
( '2016-10-19', 97.3, 17.8, 3.9, 6.0 ),
( '2016-10-20', 96.3, 17.7, 3.9, 6.0 ),
( '2016-10-21', 96.8, 17.1, 3.9, 5.0 ),
( '2016-10-22', 98.2, 18.7, 3.9, 6.0 ),
( '2016-10-23', 100.2, 17.1, 4.1, 6.0 )
;