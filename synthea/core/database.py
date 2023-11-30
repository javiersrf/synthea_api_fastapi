from core.settings import SQLALCHEMY_DATABASE_URL
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
