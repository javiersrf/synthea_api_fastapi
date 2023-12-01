from sqlalchemy import Column, String

from synthea.core.models.base import BModel


class User(BModel):
    __tablename__ = "users"
    username = Column(String(255), nullable=False)
    password = Column(String(300), nullable=False)
