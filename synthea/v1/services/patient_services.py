from bs4 import BeautifulSoup
from fastapi import HTTPException
from psycopg2.errors import UniqueViolation
from pydantic import ValidationError
from sqlalchemy.orm import Session
from starlette.datastructures import UploadFile
from starlette.status import HTTP_400_BAD_REQUEST

from synthea.core.models.patient import Patient
from synthea.core.schemas.patient import PatientIn, PatientPut
from synthea.utils.files import extract_xml_file_content, is_xml
from synthea.v1.repo.patient import PatientRepository


class PatientServices:
    @classmethod
    def list_patients(cls, db: Session, q=None, **params):
        repo = PatientRepository(db=db)
        result = repo.search(q=q, **params) if q else repo.list(**params)
        return result

    @classmethod
    def get_patient(cls, db: Session, pk: int):
        repo = PatientRepository(db=db)
        patient = repo.get(pk=pk)

        return patient

    @classmethod
    def delete_patient(cls, db: Session, pk: int):
        repo = PatientRepository(db=db)
        patient = repo.get(pk=pk)
        repo.delete(patient=patient)
        return None

    @classmethod
    async def insert_patient(cls, data: PatientIn, db: Session):
        repo = PatientRepository(db=db)
        patient = Patient(**data.model_dump())
        if repo.get(pk=patient.id):
            raise duplicated_error(patient.id)
        try:
            return repo.create(patient=patient)
        except UniqueViolation as exc:
            raise duplicated_error(patient.id) from exc

    @classmethod
    async def update_patient(
        cls, patient: Patient, data: PatientPut, db: Session
    ) -> Patient:
        if not patient:
            raise HTTPException(
                detail="Patient not found",
                status_code=HTTP_400_BAD_REQUEST,
            )
        for key, value in data.model_dump().items():
            if value:
                setattr(patient, key, value)
        db.commit()
        return patient

    @classmethod
    async def insert_patients_from_file(cls, file: UploadFile, db: Session):
        if not (isinstance(file, UploadFile) and is_xml(file=file)):
            raise HTTPException(
                detail=f"wrong format data {file.filename} - {file.content_type}",
                status_code=HTTP_400_BAD_REQUEST,
            )
        content = await extract_xml_file_content(file=file)
        if not content:
            raise HTTPException(
                detail="There was an error uploading the file(s)",
                status_code=HTTP_400_BAD_REQUEST,
            )
        try:
            patient_data: PatientIn = cls._extract_patient_from_file_content(
                file_content=content
            )
        except ValidationError as ecx:
            raise HTTPException(
                detail=ecx.errors(),
                status_code=HTTP_400_BAD_REQUEST,
            )
        patient = Patient(**patient_data.model_dump())
        repo = PatientRepository(db=db)
        if patient.id and repo.get(pk=patient.id):
            raise duplicated_error(patient.id)
        try:
            return repo.create(patient=patient)
        except UniqueViolation as exc:
            raise duplicated_error(patient.id) from exc

    @classmethod
    def _extract_patient_from_file_content(cls, file_content):
        node = BeautifulSoup(file_content)
        patient_node = node.find("patient")
        name = patient_node.find("name").find("given").text
        family = patient_node.find("name").find("family").text
        _id = node.find("id").get("extension")
        patient = PatientIn(family=family, name=name, id=_id)

        return patient


def duplicated_error(id):
    return HTTPException(
        detail=f"A patient with this ID {id} already exists in the database.",
        status_code=HTTP_400_BAD_REQUEST,
    )
