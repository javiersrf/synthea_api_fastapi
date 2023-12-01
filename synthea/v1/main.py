from fastapi import FastAPI

from synthea.v1.endpoints import auth, patient, user

app = FastAPI()


@app.get("/")
async def index():
    return {"message": "Welcome to v1 application!"}


app.include_router(patient.router)
app.include_router(auth.router)
app.include_router(user.router)
