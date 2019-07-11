/*
  Authentication query

  query user($login: @login) {
    password(target: $parent.id, hash: @hash}
  }
*/
CREATE OR REPLACE FUNCTION security.password_query_user(
  login text,
  hash bytea
)
RETURNS
  mesh.id
AS $$ BEGIN
  RETURN (SELECT
      "user".id
    FROM security.user
      JOIN (
        security.password
        JOIN mesh.link ON (link.id = password.id)
      ) AS password ON (password.hash = password_query_user.hash AND password.target = "user".id)
    WHERE
      "user".login = password_query_user.login
  );
END $$ LANGUAGE plpgsql;
