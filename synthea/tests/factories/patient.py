from factory import faker

from synthea.core.models.patient import Patient
from synthea.tests.conftest import session
from synthea.tests.factories.base import BaseFactory


class PatientFactory(BaseFactory):
    id = faker.Faker("pystr")
    name = faker.Faker("name")
    family = faker.Faker("name")

    class Meta:
        model = Patient
        sqlalchemy_session_persistence = "commit"
        sqlalchemy_session = session
