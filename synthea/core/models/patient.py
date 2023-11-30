from core.models import BModel
from sqlalchemy import Column, String


class Patient(BModel):
    __tablename__ = "patients"
    id = Column(String(255), primary_key=True)
    name = Column(String(255), nullable=False)
    family = Column(String(255))
