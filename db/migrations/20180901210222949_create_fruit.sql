-- +micrate Up
CREATE TABLE fruit (
  id BIGSERIAL PRIMARY KEY,
  no VARCHAR,
  description VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS fruit;
