from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from .. import models, schemas
from ..database import get_db

router = APIRouter(
    prefix="/data",
    tags=["Dados dos Sensores"],
)

@router.get(
    "/sensors",
    response_model=List[schemas.SensorData],
    summary="Consulta todos os dados de sensores",
    description="Retorna uma lista com os últimos registros de todos os tipos de sensores, ordenados do mais novo para o mais antigo."
)
def read_all_sensor_data(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    sensor_data = (
        db.query(models.SensorData)
        .order_by(models.SensorData.id.desc())
        .offset(skip)
        .limit(limit)
        .all()
    )
    return sensor_data

@router.get(
    "/sensors/temperatura",
    response_model=List[schemas.SensorData],
    summary="Consulta apenas os dados de temperatura",
    description="Retorna uma lista com os últimos registros de temperatura, ordenados do mais novo para o mais antigo."
)
def read_temperature_data(skip: int = 0, limit: int = 20, db: Session = Depends(get_db)):
    temperature_data = (
        db.query(models.SensorData)
        .filter(models.SensorData.topic.like("%temperatura%"))
        .order_by(models.SensorData.id.desc())
        .offset(skip)
        .limit(limit)
        .all()
    )
    return temperature_data

@router.get(
    "/sensors/umidade",
    response_model=List[schemas.SensorData],
    summary="Consulta apenas os dados de umidade",
    description="Retorna uma lista com os últimos registros de umidade, ordenados do mais novo para o mais antigo."
)
def read_humidity_data(skip: int = 0, limit: int = 20, db: Session = Depends(get_db)):
    humidity_data = (
        db.query(models.SensorData)
        .filter(models.SensorData.topic.like("%umidade%"))
        .order_by(models.SensorData.id.desc())
        .offset(skip)
        .limit(limit)
        .all()
    )
    return humidity_data
