-- Create admin user table if not exists
CREATE TABLE IF NOT EXISTS admin_users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert admin user
INSERT INTO admin_users (email, password) 
VALUES ('rokon@genaibd.com', 'rokon@2025')
ON CONFLICT (email) DO NOTHING;

-- Grant privileges to the postgres user
GRANT ALL PRIVILEGES ON DATABASE nawabii TO rokon;
