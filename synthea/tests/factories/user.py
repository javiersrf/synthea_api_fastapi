from factory import faker

from synthea.core.models.user import User
from synthea.tests.conftest import session
from synthea.tests.factories.base import BaseFactory


class UserFactory(BaseFactory):
    username = faker.Faker("name")
    password = faker.Faker("pystr")

    class Meta:
        model = User
        sqlalchemy_session_persistence = "commit"
        sqlalchemy_session = session
