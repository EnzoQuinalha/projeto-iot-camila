from sqlalchemy import Column, Integer, String, Float, DateTime
from sqlalchemy.sql import func
from .database import Base

class SensorData(Base):
    __tablename__ = "sensor_data"

    id = Column(Integer, primary_key=True, index=True)
    topic = Column(String(255), index=True)
    value = Column(Float)
    unit = Column(String(50))
    timestamp = Column(DateTime(timezone=True), server_default=func.now())

class ProductionLog(Base):
    __tablename__ = "production_logs"

    id = Column(Integer, primary_key=True, index=True)
    product_id = Column(String(100))
    status = Column(String(50)) 
    details = Column(String(500))
    timestamp = Column(DateTime(timezone=True), server_default=func.now())