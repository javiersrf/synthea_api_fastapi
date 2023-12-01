from fastapi import FastAPI

from synthea.v1.endpoints import patient

app = FastAPI()


@app.get("/")
async def index():
    return {"message": "Welcome to v1 application!"}


app.include_router(patient.router)
