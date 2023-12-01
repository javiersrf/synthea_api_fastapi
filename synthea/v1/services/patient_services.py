from bs4 import BeautifulSoup
from fastapi import HTTPException, UploadFile
from sqlalchemy.orm import Session
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
        return repo.create(patient=patient)

    @classmethod
    async def update_patient(
        cls, patient: Patient, data: PatientPut, db: Session
    ) -> Patient:
        if patient:
            for key, value in data.model_dump().items():
                if value:
                    setattr(patient, key, value)
            db.commit()
            return patient
        return None

    @classmethod
    async def insert_patients_from_files(cls, file: UploadFile, db: Session):
        if not is_xml(file=file):
            raise HTTPException(
                detail={"message": "wrong format data"},
                status_code=HTTP_400_BAD_REQUEST,
            )
        content = await extract_xml_file_content(file=file)
        patient = cls._extract_patient_from_file_content(file_content=content)

        repo = PatientRepository(db=db)
        return repo.create(patient=patient)

    @classmethod
    def _extract_patient_from_file_content(cls, file_content):
        node = BeautifulSoup(file_content)
        patient_node = node.find("patient")
        name = patient_node.find("name").find("given").text
        family = patient_node.find("name").find("family").text
        _id = node.find("id").get("extension")
        return Patient(id=_id, name=name, family=family)
