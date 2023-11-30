from typing import Any

from sqlalchemy import Column, DateTime, Integer, func, inspect
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class BModel(Base):
    """Base model with soft-delete fields"""

    __abstract__ = True

    id = Column(Integer, primary_key=True, index=True)
    created_at = Column(DateTime, default=func.now(), nullable=False)
    updated_at = Column(
        DateTime, default=func.now(), onupdate=func.now(), nullable=False
    )
    deleted_at = Column(DateTime, nullable=True)

    def delete(self):
        self.deleted_at = func.now()

    def dict(self) -> dict[str, Any]:
        return {c.key: getattr(self, c.key) for c in inspect(self).mapper.column_attrs}
