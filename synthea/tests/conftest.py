# conftest.py
import pytest
from fastapi.testclient import TestClient

from synthea.app import app


@pytest.fixture(scope="module")
def client():
    with TestClient(app) as client:
        yield client
