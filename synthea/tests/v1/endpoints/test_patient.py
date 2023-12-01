from io import BytesIO

from synthea.core.models.patient import Patient
from synthea.tests.factories.patient import PatientFactory
from synthea.tests.utils import as_str

PATH = "/v1/patients/"


def build_expected(patient: Patient):
    return {
        "id": patient.id,
        "name": patient.name,
        "family": patient.family,
        "created_at": as_str(patient.created_at),
        "updated_at": as_str(patient.updated_at),
    }


def test_list_all(client, token):
    patients = PatientFactory.create_batch(2)
    response = client.get(PATH, headers={"Authorization": f"Bearer {token}"})
    assert response.status_code == 200
    assert response.json() == [build_expected(patient) for patient in patients]


def test_get_patient(client, token):
    [patient, _] = PatientFactory.create_batch(2)
    url = PATH + str(patient.id)
    response = client.get(url, headers={"Authorization": f"Bearer {token}"})
    assert response.status_code == 200
    assert response.json() == build_expected(patient)


def test_patient_not_found(client, token):
    patient = PatientFactory()
    url = PATH + str(patient.id + "123")
    response = client.get(url, headers={"Authorization": f"Bearer {token}"})
    assert response.status_code == 404


def test_post_patient_success(client, token):
    patient_data = {"name": "Test Name", "family": "Test Family"}
    response = client.post(
        PATH,
        json=patient_data,
        headers={"Authorization": f"Bearer {token}"},
    )
    assert response.status_code == 200
    data = response.json()
    assert data["id"] is not None
    assert data["name"] == "Test Name"
    assert data["family"] == "Test Family"


def test_post_patient_invalid_data(client, token):
    response = client.post(
        "/v1/patients/", json={"name": ""}, headers={"Authorization": f"Bearer {token}"}
    )
    assert response.status_code == 422


def test_post_patient_from_file(client, token):
    input_file = "tests/mock/mock_input_file.xml"
    with open(input_file, "rb") as mock_file:
        fake_file_content = mock_file.read()

    fake_file = BytesIO(fake_file_content)
    fake_file.name = "mock_input_file.xml"

    response = client.post(
        "/v1/patients/import/",
        files={"file": ("mock_input_file.xml", fake_file, "text/xml")},
        headers={"Authorization": f"Bearer {token}"},
    )

    assert response.status_code == 200
    data = response.json()
    assert data["id"] == "799ff48f-934b-3e47-f3ea-9b0edaa43c93"
    assert data["name"] == "Aaron697"
    assert data["family"] == "Welch179"


def test_update_patient(client, token):
    patient = PatientFactory(name="aaron")
    url = PATH + str(patient.id)
    updated_data = {"name": "bbron"}
    response = client.put(
        url, json=updated_data, headers={"Authorization": f"Bearer {token}"}
    )
    assert response.status_code == 200
    assert response.json() == build_expected(patient) | updated_data


def test_list_patients_with_query(client, token):
    [patient, _] = PatientFactory.create_batch(2)
    response = client.get(
        f"/v1/patients/?q={patient.family}",
        headers={"Authorization": f"Bearer {token}"},
    )
    assert response.status_code == 200
    data = response.json()
    assert data == [build_expected(patient=patient)]


def test_list_patients_with_query_no_result(client, token):
    PatientFactory.create_batch(2)
    response = client.get(
        "/v1/patients/?q=randon", headers={"Authorization": f"Bearer {token}"}
    )
    assert response.status_code == 200
    assert response.json() == []


def test_delete_patient(client, token):
    patient = PatientFactory()
    response = client.get(
        f"/v1/patients/{patient.id}", headers={"Authorization": f"Bearer {token}"}
    )
    assert response.status_code == 200

    response = client.delete(
        f"/v1/patients/{patient.id}", headers={"Authorization": f"Bearer {token}"}
    )
    assert response.status_code == 202

    response = client.get(
        f"/v1/patients/{patient.id}", headers={"Authorization": f"Bearer {token}"}
    )
    assert response.status_code == 404
