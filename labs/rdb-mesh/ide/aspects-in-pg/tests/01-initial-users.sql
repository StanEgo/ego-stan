-- Test "origo" user authentication --------------------------------------------
DO $$
DECLARE
  _result text;
  _login text = 'origo';
  _hash bytea = '!qa2Ws3eD';
BEGIN

-- Valid query -----------------------------------------------------------------
IF security.password_query_user(_login, _hash) IS NULL THEN
  RAISE EXCEPTION 'TEST: Valid auth for [%]', _login;
END IF;

-- Query with wrong password ---------------------------------------------------
IF security.password_query_user(_login, 'wrong_pass') IS NOT NULL THEN
  RAISE EXCEPTION 'TEST: Invalid auth password';
END IF;

-- Query with wrong login ------------------------------------------------------
IF security.password_query_user('wrong_login', _hash) IS NOT NULL THEN
  RAISE EXCEPTION 'TEST: Invalid auth login';
END IF;

END $$ LANGUAGE plpgsql;

-- Initial users of the mesh -------------------------------------------------
DO $$
DECLARE
  _login text;
  _hash bytea;
BEGIN

-- Stan ------------------------------------------------------------------------
_login := 'stan';
_hash := '@ws3Ed4rF';

IF security.password_register_user(_login, _hash) != 'user-stan' THEN
  RAISE EXCEPTION 'TEST: Not valid return after user registration';
END IF;

IF security.password_query_user(_login, _hash) IS NULL THEN
  RAISE EXCEPTION 'TEST: Valid auth for [%]', _login;
END IF;

-- Yavulan ---------------------------------------------------------------------
_login := 'yavulan';
_hash := '#ed4Rf5tG';

IF security.password_register_user(_login, _hash) != 'user-yavulan' THEN
  RAISE EXCEPTION 'TEST: Not valid return after user registration';
END IF;

IF security.password_query_user(_login, _hash) IS NULL THEN
  RAISE EXCEPTION 'TEST: Valid auth for [%]', _login;
END IF;

-- Julia -----------------------------------------------------------------------
_login := 'julia';
_hash := '$rf5Tg6yH';

IF security.password_register_user(_login, _hash) != 'user-julia' THEN
  RAISE EXCEPTION 'TEST: Not valid return after user registration';
END IF;

IF security.password_query_user(_login, _hash) IS NULL THEN
  RAISE EXCEPTION 'TEST: Valid auth for [%]', _login;
END IF;

END $$ LANGUAGE plpgsql;
