import uuid

from sqlalchemy import Column, String

from synthea.core.models.base import BModel


class Patient(BModel):
    __tablename__ = "patients"
    id = Column(String(255), primary_key=True, default=lambda _: str(uuid.uuid4()))
    name = Column(String(255), nullable=False)
    family = Column(String(255))
