from bs4 import BeautifulSoup
from core.models.patient import Patient
from core.schemas.patient import PatientIn
from sqlalchemy.orm import Session
from v1.repo.patient import PatientRepository
from fastapi import UploadFile, HTTPException
from utils.files import is_xml, is_pdf, extract_xml_from_pdf, extract_xml_file_content
from starlette.status import HTTP_400_BAD_REQUEST
import logging

class PatientServices:

    @classmethod
    def list_patients(cls, db: Session, **params):
        repo = PatientRepository(db=db)
        return repo.list(**params)

    @classmethod
    async def create_patient(cls, files: list[UploadFile], patient_in: PatientIn | None, db: Session):
        if files:
            return await cls.insert_patients_from_files(db=db, files=files)
        if patient_in:
            return await cls.insert_patient(data=patient_in, db=db)
        raise HTTPException(detail={"message":"missing patient data"}, status_code=HTTP_400_BAD_REQUEST)

    @classmethod
    async def insert_patient(cls, data: PatientIn, db: Session):
        repo = PatientRepository(db=db)
        patient = Patient(**data)
        return repo.create(patient=patient)
    
    @classmethod
    async def insert_patients_from_files(cls, files: list[UploadFile], db: Session):
        patients = []
        for file in files:
            if not is_xml(file=file):
                raise HTTPException(detail={"message":"wrong format data"}, status_code=HTTP_400_BAD_REQUEST)
            content = await extract_xml_file_content(file=file)

            patients.append(cls._extract_patient_from_file_content(file_content=content))
        repo = PatientRepository(db=db)
        repo.bulk_create(patients=patients)
        return patients

    @classmethod
    def _extract_patient_from_file_content(cls, file_content):
        node = BeautifulSoup(file_content)
        patient_node = node.find("patient")
        name = patient_node.find("name").find("given").text
        family = patient_node.find("name").find("family").text
        _id = node.find("id").get("extension")
        return Patient(id=_id, name=name, family=family)
