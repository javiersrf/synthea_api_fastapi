from datetime import datetime

from pydantic import BaseModel, validator


class PatientIn(BaseModel):
    id: str | None = None
    name: str
    family: str

    @validator("*", pre=True)
    def blank_string(cls, value):
        if value == "":
            return None
        return value


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
