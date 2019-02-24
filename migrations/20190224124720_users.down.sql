DROP INDEX IF EXISTS users_email;

DROP INDEX IF EXISTS users_username;

DROP TRIGGER IF EXISTS user_timestamp ON users;

DROP TABLE IF EXISTS users;

DROP TYPE IF EXISTS user_type;

DROP Function IF EXISTS update_timestamp;