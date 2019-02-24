CREATE OR REPLACE FUNCTION update_timestamp()
  RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE EXTENSION if not exists citext;

CREATE TYPE user_type AS ENUM ('user', 'guest');

CREATE TABLE IF NOT EXISTS Users (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  username citext UNIQUE NOT NULL check (length(username) <= 255),
  email citext UNIQUE,
  salt VARCHAR UNIQUE NOT NULL,
  password VARCHAR NOT NULL,
  type user_type NOT NULL DEFAULT 'user',
  active BOOLEAN DEFAULT TRUE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL
);

CREATE TRIGGER user_timestamp BEFORE INSERT OR UPDATE on users FOR EACH ROW EXECUTE PROCEDURE update_timestamp();

CREATE UNIQUE INDEX users_username ON users (username);

CREATE UNIQUE INDEX users_email ON users (email);