from synthea.core.security import get_password_hash
from synthea.tests.factories.user import UserFactory

PATH = "/v1/auth/"


def test_authenticate(client):
    user = UserFactory(username="anakin", password=get_password_hash("12345"))
    data = {"username": "anakin", "password": "12345"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )
    assert response.status_code == 201
    output = response.json()
    assert output["id"] is not None
    assert output["username"] == user.username
    assert output.get("password") is None
    assert output.get("token") is not None


def test_authenticate_failed_wrong_username(client):
    UserFactory(username="anakin", password=get_password_hash("12345"))
    data = {"username": "yoda", "password": "12345"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )
    assert response.status_code == 400
    assert response.json() == {"detail": "Username not found"}


def test_authenticate_failed_wrong_password(client):
    UserFactory(username="anakin", password=get_password_hash("12345"))
    data = {"username": "anakin", "password": "6789"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )
    assert response.status_code == 400
    assert response.json() == {"detail": "Wrong password"}


def test_verify_token_authenticate(client):
    user = UserFactory(password=get_password_hash("12345"))
    data = {"username": user.username, "password": "12345"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )
    data = response.json()
    token = data["token"]["access_token"]

    response = client.get(
        PATH,
        headers={"Authorization": f"Bearer {token}"},
    )
    assert response.status_code == 201
    output = response.json()
    assert output["id"] == user.id
    assert output["username"] == user.username


def test_verify_token_not_authenticate(client):
    user = UserFactory(password=get_password_hash("12345"))
    data = {"username": user.username, "password": "12345"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )
    data = response.json()
    response = client.get(
        PATH,
        headers={"Authorization": "Bearer 123"},
    )
    assert response.status_code == 401


def test_verify_token_user_not_validate(client):
    fake_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlRhbW1pZSBDaGFzZSIsImlkIjoxLCJleHAiOjE3MDE1NjMyNjN9.pTVt-8CgyOQXOh6ef-NoXNrWlScNA0Brkwu2FfBYx1s"

    response = client.get(
        PATH,
        headers={"Authorization": f"Bearer {fake_token}"},
    )
    assert response.status_code == 401
    assert response.json() == {"detail": "Could not validate credentials"}
