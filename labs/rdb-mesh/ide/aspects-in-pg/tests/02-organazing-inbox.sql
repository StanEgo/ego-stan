DO $$
DECLARE
  _result mesh.id;
BEGIN
  _result = content.inbox_add_email(
    owner := 'user-stan',
    inbox := 'user-stan',
    subject := 'Welcome to IDE.run',
    content := '',
    sender := 'noreply@ide.run',
    recipients := '{stan@ide.run}'
  );

  IF _result <> 'email-user-stan-welcome-to-ide-run' THEN
    RAISE EXCEPTION 'TEST: Not valid return after inbox added (%)', _result;
  END IF;

  _result = content.inbox_add_email(
    owner := 'user-stan',
    inbox := 'user-stan',
    subject := 'Mail verification',
    content := '',
    sender := 'noreply@ide.run',
    recipients := '{stan@ide.run}'
  );

  IF _result <> 'email-user-stan-mail-verification' THEN
    RAISE EXCEPTION 'TEST: Not valid return after inbox added (%)', _result;
  END IF;

  _result = content.inbox_add_text(
    owner := 'user-stan',
    inbox := 'user-stan',
    text := 'First Note'
  );

  IF _result <> 'text-user-stan-first-note' THEN
    RAISE EXCEPTION 'TEST: Not valid return after inbox added (%)', _result;
  END IF;
END $$ LANGUAGE plpgsql;

DO $$
DECLARE
  _result text;
BEGIN
   _result = (
     SELECT
       string_agg(id::text, '|' ORDER BY id)
     FROM
       mesh.link_query('user-stan', 'relation-inbox')
   );

  IF _result <> 'email-user-stan-mail-verification|email-user-stan-welcome-to-ide-run|text-user-stan-first-note' THEN
    RAISE EXCEPTION 'TEST: Not expected inbox returned (%)', _result;
  END IF;
END $$ LANGUAGE plpgsql;
