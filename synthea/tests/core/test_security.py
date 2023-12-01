from jose import jwt

from synthea.core.security import SECRET_KEY, create_access_token


def test_jwt():
    data = {"test": "test"}
    token = create_access_token(data)

    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])

    assert decoded["test"] == data["test"]
    assert decoded["exp"] is not None
