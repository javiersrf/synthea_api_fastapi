PATH = "/v1"


def test_read_index(client):
    response = client.get(PATH)
    assert response.status_code == 200
    assert response.json() == {"message": "Welcome to v1 application!"}
