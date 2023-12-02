-- Create the 'synthea' database
-- CREATE DATABASE synthea;

-- Connect to the 'synthea' database
\c synthea

CREATE USER api WITH PASSWORD 'jw8s0F4';
GRANT ALL PRIVILEGES ON DATABASE synthea TO api;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO api;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO api;


-- Create the 'patients' table
CREATE TABLE patients (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    family VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create the 'users' table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

INSERT INTO patients (id, name, family, created_at, updated_at, deleted_at)
VALUES (
    '5ddcacd2-0664-466d-0f9c-1cf4d3e0fd0e',
    'Leon728',
    'Lind531',
    NOW(),
    NOW(),
    NULL 
);

INSERT INTO patients (id, name, family, created_at, updated_at, deleted_at)
VALUES (
    '3907c6e0-c410-f7ab-cd91-423292dba137',
    'Nicolas769',
    'Walter473',
    NOW(), 
    NOW(),
    NULL
);