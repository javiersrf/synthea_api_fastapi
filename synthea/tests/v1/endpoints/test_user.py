from synthea.core.security import get_password_hash
from synthea.tests.factories.user import UserFactory

PATH = "/v1/users/"


def test_create_user_success(client):
    data = {"username": "anakin", "password": "12345"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )
    assert response.status_code == 201
    output = response.json()
    assert output["id"] is not None
    assert output["username"] == "anakin"
    assert output.get("password") is None
    assert output.get("token") is not None


def test_create_user_fail_duplicated(client):
    UserFactory(username="anakin", password=get_password_hash("12345"))

    data = {"username": "anakin", "password": "death-star"}
    response = client.post(
        PATH, json=data, headers={"content-type": "application/json"}
    )  # Duplicated User
    assert response.status_code == 400
    output = response.json()
    assert output == {"detail": "Username already registered"}
