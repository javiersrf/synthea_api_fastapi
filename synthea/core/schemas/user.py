from datetime import datetime

from pydantic import BaseModel

from synthea.core.schemas.token import Token


class UserIn(BaseModel):
    username: str
    password: str


class UserPut(BaseModel):
    username: str


class UserOut(BaseModel):
    id: int
    username: str
    created_at: datetime
    updated_at: datetime


class UserToken(UserOut):
    token: Token
