from pydantic import BaseModel
from datetime import datetime
from typing import Optional

# Este é o nosso "contrato" de como os dados de um sensor
# devem ser representados na API.

class SensorData(BaseModel):
    # Campos que esperamos que existam na nossa API de resposta
    id: int
    topic: str
    value: float
    unit: str
    timestamp: datetime

    # Esta classe de configuração é uma "ponte" entre o modelo de banco de dados
    # do SQLAlchemy (que é um objeto) e o modelo de API do Pydantic (que
    # precisa ser convertido para JSON). A linha orm_mode = True faz essa
    # conversão de forma automática e mágica.
    class Config:
        from_attributes = True # Em versões mais novas do Pydantic, usa-se 'from_attributes'
        orm_mode = True # Em versões mais antigas, usa-se 'orm_mode'