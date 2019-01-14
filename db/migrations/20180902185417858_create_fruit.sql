-- +micrate Up
CREATE TABLE fruit (
  id INTEGER NOT NULL PRIMARY KEY,
  no VARCHAR NOT NULL UNIQUE,
  description TEXT NOT NULL
);

-- +micrate Down
DROP TABLE IF EXISTS fruit;
