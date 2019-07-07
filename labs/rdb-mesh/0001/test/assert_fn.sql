/******************************************************************************

    TODO:Documentation and examples

    @examples
  
    DO $$ BEGIN
        PERFORM test.assert_fn('test.view_projects_list()', '(456,project,MeshDB)');
    END $$;
	
 ******************************************************************************/
CREATE OR REPLACE FUNCTION test.assert_fn(name text, VARIADIC expected text[])
RETURNS void
AS $BODY$
DECLARE
  _query text;
  _count int;
  _actual text[];
  _results text[];
  _result text;
BEGIN
  _query := FORMAT('SELECT array_agg(_temp) FROM (SELECT * FROM %s) AS _temp', assert_fn.name);
  EXECUTE _query INTO _actual;

  FOR _result IN SELECT
    CASE
      WHEN expected.unnest IS NOT NULL THEN format('[TEST:%s] Expected %s but was not found', name, expected.unnest::text)
      ELSE format('[TEST:%s] Unexpected %s was found', name, actual.unnest::text)
    END
  FROM
    (SELECT unnest(assert_fn.expected)) AS expected
    FULL OUTER JOIN
    (SELECT unnest(_actual)) AS actual
    ON (expected.unnest = actual.unnest)
  WHERE
    (expected.unnest IS NULL AND actual.unnest IS NOT NULL)
    OR (actual.unnest IS NULL AND expected.unnest IS NOT NULL)
  LOOP
    RAISE WARNING '%', _result;
  END LOOP;
END
$BODY$ LANGUAGE plpgsql;
