from fastapi import Depends, HTTPException
from jose import JWTError, jwt
from sqlalchemy.orm import Session
from starlette import status

from synthea.core.dependencies import get_db
from synthea.core.models.user import User
from synthea.core.schemas.user import UserIn
from synthea.core.security import (ALGORITHM, SECRET_KEY, create_access_token,
                                   get_password_hash, verify_password,
                                   verify_token)
from synthea.v1.repo.user import UserRepository


class UserServices:
    @classmethod
    def create_user(cls, db: Session, user: UserIn):
        repo = UserRepository(db=db)
        db_user = repo.find(username=user.username)
        if db_user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Username already registered",
            )

        hashed_password = get_password_hash(user.password)

        db_user = User(
            username=user.username,
            password=hashed_password,
        )
        db.add(db_user)
        db.commit()
        db.flush()
        db.refresh(db_user)
        access_token = create_access_token(data={"username": user.username})
        return db_user.dict() | _create_acess_token_output(access_token=access_token)

    @classmethod
    def get_user(db: Session, pk: int):
        repo = UserRepository(db=db)
        return repo.get(pk=pk)

    @classmethod
    def auth(cls, db: Session, user: UserIn):
        repo = UserRepository(db=db)
        db_user = repo.find(username=user.username)
        if not db_user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Username not found"
            )
        if not verify_password(user.password, db_user.password):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Wrong password"
            )

        access_token = create_access_token(data={"username": user.username})
        return db_user.dict() | _create_acess_token_output(access_token=access_token)

    @classmethod
    async def get_current_user(
        cls,
        db: Session = Depends(get_db),
        token: str = Depends(verify_token),
    ):
        credentials_exception = HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Could not validate credentials",
            headers={"WWW-Authenticate": "Bearer"},
        )

        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username: str = payload.get("username")
            if not username:
                raise credentials_exception
        except JWTError:
            raise credentials_exception

        repo = UserRepository(db=db)
        db_user = repo.find(username=username)

        if db_user is None:
            raise credentials_exception
        return db_user


def _create_acess_token_output(access_token):
    return {"token": {"access_token": access_token, "token_type": "bearer"}}
