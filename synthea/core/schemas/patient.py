from datetime import datetime

from pydantic import BaseModel


class PatientIn(BaseModel):
    id: str | None = None
    name: str
    family: str


class PatientPut(BaseModel):
    id: str | None = None
    name: str | None = None
    family: str | None = None


class PatientOut(BaseModel):
    id: str
    name: str
    family: str
    created_at: datetime
    updated_at: datetime
