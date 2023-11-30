# conftest.py
import pytest
from fastapi.testclient import TestClient

from synthea.main import app
from fastapi.testclient import TestClient
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import scoped_session, sessionmaker

from sqlalchemy.pool import StaticPool
from synthea.core.settings import SQLALCHEMY_DATABASE_URL
from synthea.core.dependencies import get_db
from synthea.core.models.base import Base
import os

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
        os.remove("./test.db")

app.dependency_overrides[get_db] = override_get_db

@pytest.fixture(autouse=True, scope="session")
def resource():
    print("setup")
    Base.metadata.create_all(bind=engine)
    yield "resource"
    print("teardown")
    Base.metadata.drop_all(bind=engine)


@pytest.fixture(scope="module", autouse=True)
def client():
    with TestClient(app) as client:
        yield client
