/*
  Registration mutation

  mutation Register($login, $hash) {
    entity {
      user(login: $login) {
        password(target: $parent.id, hash: $hash)
      }
      person(firstName: 'Stan', lastName: 'Ya')
    }
  }
 */
CREATE OR REPLACE FUNCTION security.password_register_user(
  login text,
  hash bytea
)
RETURNS
  mesh.id
AS $$
DECLARE
  _user_id mesh.id;
  _password_id mesh.id;
BEGIN

_user_id = 'user-' || password_register_user.login;
_password_id = 'password-' || password_register_user.login;

INSERT INTO mesh.entity(id, owner) VALUES(_user_id, _user_id);

INSERT INTO security.user(id, login) VALUES(_user_id, password_register_user.login);

INSERT INTO mesh.entity(id, owner) VALUES(_password_id, _user_id);
INSERT INTO mesh.link VALUES(_password_id, _user_id, 'relation-auth');
INSERT INTO security.password VALUES(_password_id, password_register_user.hash);

RETURN _user_id;

END $$ LANGUAGE plpgsql;
