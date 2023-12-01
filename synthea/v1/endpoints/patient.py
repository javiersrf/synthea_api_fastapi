from fastapi import APIRouter, Depends, HTTPException, UploadFile
from starlette import status

from synthea.core.dependencies import get_db
from synthea.core.schemas.patient import PatientIn, PatientOut, PatientPut
from synthea.v1.services.patient_services import PatientServices
from synthea.v1.services.user_services import UserServices

router = APIRouter(
    prefix="/patients",
    tags=["patients"],
    dependencies=[Depends(UserServices.get_current_user)],
)


@router.get("/", response_model=list[PatientOut])
async def list_patient(
    q: str | None = None, limit: int = None, start: int = None, db=Depends(get_db)
):
    return PatientServices.list_patients(db, q=q, limit=limit, start=start)


@router.get("/{patient_id}", response_model=PatientOut)
async def get_patient(patient_id: str, db=Depends(get_db)):
    if not (patient := PatientServices.get_patient(db=db, pk=patient_id)):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Patient not found"
        )
    return patient


@router.delete("/{patient_id}", status_code=status.HTTP_202_ACCEPTED)
async def delete_patient(patient_id: str, db=Depends(get_db)):
    PatientServices.delete_patient(db=db, pk=patient_id)
    return {"message": "deleted"}


@router.post("/", response_model=PatientOut | list[PatientOut])
async def post_patient(
    patient: PatientIn,
    db=Depends(get_db),
):
    output = await PatientServices.insert_patient(
        data=patient,
        db=db,
    )
    return output


@router.post("/import/", response_model=PatientOut | list[PatientOut])
async def post_patient_from_file(
    file: UploadFile | None = None,
    db=Depends(get_db),
):
    output = await PatientServices.insert_patients_from_files(file=file, db=db)
    return output


@router.put("/{patient_id}", response_model=PatientOut)
async def update_patient(
    patient_id: str, patient_update: PatientPut, db=Depends(get_db)
):
    existing_patient = PatientServices.get_patient(db=db, pk=patient_id)
    if not existing_patient:
        raise HTTPException(status_code=404, detail="Patient not found")

    updated_patient = await PatientServices.update_patient(
        existing_patient,
        data=patient_update,
        db=db,
    )
    return updated_patient
