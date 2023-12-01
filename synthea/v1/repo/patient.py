from typing import List

from sqlalchemy import or_
from sqlalchemy.orm import Session

from synthea.core.models.patient import Patient


class PatientRepository:
    db: Session
    _model = Patient

    def __init__(self, db: Session) -> None:
        self.db = db

    @property
    def base_query(self):
        return self.db.query(self._model).filter(self._model.deleted_at.is_(None))

    def list(self, limit: int = 10, start: int = 0, **params) -> list[Patient]:
        query = self.base_query
        if params:
            query = query.filter_by(**params)

        return query.offset(start).limit(limit).all()

    def search(
        self, q: str, limit: int = 10, start: int = 0, **params
    ) -> List[Patient]:
        query = self.base_query
        query = query.filter(
            or_(Patient.name.ilike(f"%{q}%"), Patient.family.ilike(f"%{q}%"))
        )
        if params:
            query = query.filter_by(**params)

        return query.offset(start).limit(limit).all()

    def get(self, pk: str) -> Patient:
        return self.base_query.filter_by(id=pk).first()

    def create(self, patient: Patient) -> Patient:
        self.db.add(patient)
        self.db.commit()
        self.db.refresh(patient)
        return patient

    def bulk_create(self, patients: List[Patient]) -> Patient:
        self.db.bulk_save_objects(patients)
        self.db.commit()
        return self.list()

    def update(self, pk: int, **params) -> Patient:
        self.base_query.filter_by(id=pk).update(params)
        self.db.commit()
        return self.get(pk=pk)

    def delete(self, patient: Patient) -> None:
        patient.delete()
        self.db.commit()
        self.db.flush()
