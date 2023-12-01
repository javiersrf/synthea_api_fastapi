from fastapi import APIRouter, Depends, status

from synthea.core.dependencies import get_db
from synthea.core.schemas.user import UserIn, UserOut, UserToken
from synthea.v1.services.user_services import UserServices

router = APIRouter(
    prefix="/auth",
    tags=["auth", "users"],
)


@router.post("/", response_model=UserToken, status_code=status.HTTP_201_CREATED)
def authenticate(user: UserIn, db=Depends(get_db)):
    result = UserServices.auth(db=db, user=user)
    return result


@router.get("/", response_model=UserOut, status_code=status.HTTP_201_CREATED)
def verify(curr_user=Depends(UserServices.get_current_user)):
    return curr_user
