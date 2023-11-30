PATH = "/v1/patient/"


def test_read_index(client):
    response = client.get(PATH)
    assert response.status_code == 200
    assert response.json() == {"msg": "Hello World"}
