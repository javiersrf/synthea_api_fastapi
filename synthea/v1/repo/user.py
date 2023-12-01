from sqlalchemy.orm import Session

from synthea.core.models.user import User


class UserRepository:
    db: Session
    _model = User

    def __init__(self, db: Session) -> None:
        self.db = db

    @property
    def base_query(self):
        return self.db.query(self._model).filter(self._model.deleted_at.is_(None))

    def get(self, pk: str) -> User:
        return self.base_query.filter_by(id=pk).first()

    def find(self, username: str) -> User:
        return self.base_query.filter_by(username=username).first()

    def create(self, user: User) -> User:
        self.db.add(user)
        self.db.commit()
        self.db.refresh(user)
        return user

    def update(self, pk: int, **params) -> User:
        self.base_query.filter_by(id=pk).update(params)
        self.db.commit()
        return self.get(pk=pk)
