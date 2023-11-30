from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from synthea.v1.main import app as v1_app

app = FastAPI()


app.mount("/v1", v1_app)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Replace with your allowed origins
    allow_methods=["*"],  # Specify HTTP methods to allow
    allow_headers=["*"],  # Specify headers to allow
)


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000, reload=False)
