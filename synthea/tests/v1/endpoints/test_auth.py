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
