from os import getenv

SQLALCHEMY_DATABASE_URL = (
    getenv("SQLALCHEMY_DATABASE_URL")
)
