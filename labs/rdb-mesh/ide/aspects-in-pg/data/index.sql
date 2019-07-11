-- God user --------------------------------------------------------------------
INSERT INTO mesh.entity VALUES('user-origo', 'user-origo');
INSERT INTO security.user VALUES('user-origo', 'origo');

-- Relations -------------------------------------------------------------------
-- @statement {link.target} authenticates {link.id}
INSERT INTO mesh.entity VALUES('relation-auth', 'user-origo');
INSERT INTO mesh.relation VALUES('relation-auth');

-- @statement {link.target} happened in {link.id}
INSERT INTO mesh.entity VALUES('relation-inbox', 'user-origo');
INSERT INTO mesh.relation VALUES('relation-inbox');

-- @statement We investigate {link.target} of {link.id}.
INSERT INTO mesh.entity VALUES('relation-scope', 'user-origo');
INSERT INTO mesh.relation VALUES('relation-scope');

-- God authentication ----------------------------------------------------------
INSERT INTO mesh.entity VALUES('password-origo', 'user-origo');
INSERT INTO mesh.link VALUES('password-origo', 'user-origo', 'relation-auth');
INSERT INTO security.password VALUES ('password-origo', '!qa2Ws3eD');
