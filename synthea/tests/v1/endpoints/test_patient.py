from synthea.tests.factories.patient import PatientFactory
from synthea.core.models.patient import Patient
from synthea.tests.utils import as_str
PATH = "/v1/patients/"

def build_expected(patient: Patient):
    return {
        "id":patient.id,
        "name":patient.name,
        "family":patient.family,
        "created_at":as_str(patient.created_at),
        "updated_at":as_str(patient.updated_at)
    }


def test_list_all(client):
    patients = PatientFactory.create_batch(2)
    response = client.get(PATH)
    assert response.status_code == 200
    assert response.json() == [build_expected(patient) for patient in patients]
