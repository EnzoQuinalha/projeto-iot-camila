from fastapi import FastAPI
from .routers.data_router import router
description = """
API para consulta de dados da **Bancada Didática 4.0 - Nível 1 (Camila)**. 🚀

Permite o acesso aos dados de sensores coletados via MQTT e armazenados em um banco de dados MySQL.
"""

app = FastAPI(
    title="API IoT - Bancada Camila",
    description=description,
    version="1.0.0",
    contact={
        "name": "Enzo",
        "email": "enzoquinalha31@gmail.com",
    },
)
app.include_router(router)

@app.get("/", tags=["Root"])
def read_root():
    return {"message": "Bem-vindo à API da Bancada Didática Camila! Acesse /docs para a documentação."}