from synthea.core.dependencies import get_db
from synthea.core.schemas.patient import PatientIn, PatientOut
from fastapi import APIRouter, Depends, File, UploadFile
from synthea.v1.services.patient_services import PatientServices

router = APIRouter(
    prefix="/patients",
    tags=["patients"],
    # dependencies=[Depends(get_token_header)],
)


@router.get("/", response_model=list[PatientOut])
async def list_patient(db=Depends(get_db)):
    return PatientServices.list_patients(db)


@router.get("/{patient_id}", response_model=PatientOut)
async def get_patient(patient_id: int, db=Depends(get_db)):
    return {"name": "Sample Item", "description": f"A sample item {patient_id}"}


@router.post("/", response_model=PatientOut | list[PatientOut])
async def post_patient(
    patient_in: PatientIn | None = None,
    files: list[UploadFile] = File(...),
    db=Depends(get_db),
):
    output = await PatientServices.create_patient(db=db, files=files, patient_in=patient_in)
    return output
