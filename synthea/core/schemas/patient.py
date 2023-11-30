from pydantic import BaseModel
from datetime import datetime

class PatientIn(BaseModel):
    id: str
    name: str
    family: str
    created_at: datetime
    updated_at: datetime


class PatientOut(BaseModel):
    id: str
    name: str
    family: str
    created_at: datetime
    updated_at: datetime
