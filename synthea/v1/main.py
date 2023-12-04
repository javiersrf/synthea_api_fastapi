from fastapi import FastAPI

from synthea.v1.endpoints import auth, patient, user

app = FastAPI(
    title="CRUD Fastapi Application",
    summary="""This project is a comprehensive example of a CRUD (Create, Read, Update, Delete) application with soft delete functionality for data listing. It features a ready-to-use API designed for microservices, built using FastAPI. This setup not only demonstrates the essential operations of a web service but also integrates advanced features like soft deletion, which allows for non-destructive data handling. The architecture is optimized for scalability and efficiency, making it an ideal starting point for developing microservices in Python with FastAPI.""",
)


@app.get("/")
async def index():
    return {"message": "Welcome to v1 application!"}


app.include_router(patient.router)
app.include_router(auth.router)
app.include_router(user.router)
