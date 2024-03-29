CREATE TABLE lists(
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE todos(
  id serial PRIMARY KEY,
  name text NOT NULL,
  completion_status boolean NOT NULL true DEFAULT false,
  list_id integer NOT NULL REFERENCES lists(id)
);