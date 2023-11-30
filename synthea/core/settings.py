from os import getenv

SQLALCHEMY_DATABASE_URL = (
    getenv("SQLALCHEMY_DATABASE_URL") or "postgresql://api:jw8s0F4@localhost/synthea"
)
