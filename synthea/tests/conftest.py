import os

import pytest
from fastapi.testclient import TestClient
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.pool import StaticPool

from synthea.core.dependencies import get_db
from synthea.core.models.base import Base
from synthea.core.settings import SQLALCHEMY_DATABASE_URL
from synthea.main import app

engine = create_engine(
    SQLALCHEMY_DATABASE_URL,
    connect_args={"check_same_thread": False},
    poolclass=StaticPool,
)
TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = scoped_session(TestingSessionLocal)


def override_get_db():
    try:
        db = TestingSessionLocal()
        db.begin()
        yield db
    finally:
        db.rollback()
        db.close()


app.dependency_overrides[get_db] = override_get_db


@pytest.fixture(autouse=True, scope="function")
def resource():
    print("setup")
    Base.metadata.create_all(bind=engine)
    yield "resource"
    print("teardown")
    Base.metadata.drop_all(bind=engine)


@pytest.fixture(autouse=True, scope="session")
def remove_db_after_tests():
    yield "db"
    os.remove("./test.db")


@pytest.fixture(scope="module", autouse=True)
def client():
    with TestClient(app) as client:
        yield client


@pytest.fixture(autouse=False)
def token(client):
    data = {"username": "admin", "password": "12345"}
    response = client.post(
        "/v1/users/", json=data, headers={"content-type": "application/json"}
    )
    data = response.json()
    token = data["token"]["access_token"]
    return token
