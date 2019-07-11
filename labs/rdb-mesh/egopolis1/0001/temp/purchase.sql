CREATE TABLE temp.purchase (
    id serial NOT NULL,
    title text NOT NULL,
    attached_to text NULL
);

INSERT INTO temp.purchase (
    title,
    attached_to
) VALUES
( 'Ирригатор для флоссинга зубов', 'стоматология' )
;