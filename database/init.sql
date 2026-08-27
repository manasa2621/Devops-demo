CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

INSERT INTO users (name, email)
VALUES
    ('Manasa', 'manasa@example.com'),
    ('Rahul', 'rahul@example.com'),
    ('Priya', 'priya@example.com')
ON CONFLICT (email) DO NOTHING;