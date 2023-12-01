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
