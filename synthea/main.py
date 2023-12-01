from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from synthea.v1.main import app as v1_app

app = FastAPI()


app.mount("/v1", v1_app)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000, reload=False)
