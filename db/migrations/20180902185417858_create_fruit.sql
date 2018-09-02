-- +micrate Up
CREATE TABLE fruit (
  id BIGSERIAL PRIMARY KEY,
  no VARCHAR (20) NOT NULL UNIQUE,
  description VARCHAR (50) NOT NULL
);

-- +micrate Down
DROP TABLE IF EXISTS fruit;
