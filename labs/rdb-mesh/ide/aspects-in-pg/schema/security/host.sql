/*
  TODO: Simplified host-based authentication. There is an idea
  to implement memberships assigned no authentication method, not to
  user itself. For instance I can allow my TV to access my account
  using this host-based method, but this access will be very
  limited because my kids have also access to the TV,
 */
CREATE TABLE security.host (
  id mesh.id NOT NULL,
    CONSTRAINT pk_security_host PRIMARY KEY(id),
    CONSTRAINT fk_security_host_id FOREIGN KEY (id) REFERENCES mesh.link(id),

  -- Name of the host or its IP address.
  host text NOT NULL
) WITHOUT OIDS;
