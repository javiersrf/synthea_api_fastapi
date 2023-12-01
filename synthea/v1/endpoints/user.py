from fastapi import APIRouter, Depends

from synthea.core.dependencies import get_db
from synthea.core.schemas.user import UserIn, UserToken
from synthea.v1.services.user_services import UserServices

router = APIRouter(
    prefix="/users",
    tags=["auth", "users"],
)


@router.post("/", response_model=UserToken, status_code=201)
def create_user(user: UserIn, db=Depends(get_db)):
    result = UserServices.create_user(db, user=user)
    return result
