import paho.mqtt.client as mqtt
import ssl
import json
from sqlalchemy.orm import Session
import os
from dotenv import load_dotenv
import sys
import time

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from app.database import SessionLocal, engine
from app import models

load_dotenv()
print("Verificando e criando tabelas do banco de dados, se necessário...")
models.Base.metadata.create_all(bind=engine)
print("Tabelas prontas.")

MQTT_BROKER = os.getenv("MQTT_BROKER")
MQTT_PORT = int(os.getenv("MQTT_PORT"))
MQTT_USER = os.getenv("MQTT_USER")
MQTT_PSWD = os.getenv("MQTT_PSWD")
MQTT_TOPIC = os.getenv("MQTT_TOPIC")

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("✅ Conectado ao Broker MQTT com sucesso!")
        client.subscribe(MQTT_TOPIC)
        print(f"📡 Inscrito no tópico: '{MQTT_TOPIC}'")
    else:
        print(f"❌ Falha na conexão, código de retorno: {rc}")
        if rc == 5:
            print("❗ Erro de autenticação: Verifique se seu usuário e senha estão corretos.")

def on_message(client, userdata, msg):
    """
    Esta função é chamada automaticamente toda vez que uma nova mensagem
    é recebida no tópico em que estamos inscritos.
    """
    print(f"\n📩 Mensagem recebida | Tópico: {msg.topic}")
    db: Session = SessionLocal()
    try:
        payload_str = msg.payload.decode('utf-8')
        print(f"   Payload: {payload_str}")
        data = json.loads(payload_str)

        if msg.topic == "smart40n1" and isinstance(data.get("value"), (int, float)):
            
            variable_name = data.get("variable")
            value = float(data.get("value"))
            unit = " indefinida" 

            if variable_name == "temperatura":
                unit = "°C"
            elif variable_name == "umidade":
                unit = "%"
            
            new_entry = models.SensorData(
                topic=f"{msg.topic}/{variable_name}", 
                value=value,
                unit=unit
            )
            
            print(f"   💾 Inserindo em 'sensor_data': {variable_name} = {value}{unit}")
            db.add(new_entry)
            db.commit()
            print("   ✅ Dados persistidos no banco de dados com sucesso!")

        else:
            if not isinstance(data.get("value"), (int, float)):
                 print("   ⚠️ Mensagem ignorada: O valor não é numérico.")
            else:
                 print("   ⚠️ Tópico não corresponde a nenhuma regra de armazenamento.")

    except json.JSONDecodeError:
        print("   ❌ ERRO: A mensagem recebida não está em um formato JSON válido.")
    except Exception as e:
        print(f"   ❌ ERRO ao processar ou salvar a mensagem: {e}")
        db.rollback()
    finally:
        db.close()

def run_consumer():
    client_id = f"python-mqtt-consumer-{time.time()}"
    client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION1, client_id=client_id)

    client.username_pw_set(MQTT_USER, MQTT_PSWD)
    client.tls_set(tls_version=ssl.PROTOCOL_TLS)

    client.on_connect = on_connect
    client.on_message = on_message

    try:
        print(f"🔌 Tentando conectar ao broker em {MQTT_BROKER}:{MQTT_PORT}...")
        client.connect(MQTT_BROKER, MQTT_PORT, 60)
        client.loop_forever()
    except Exception as e:
        print(f"❌ Uma exceção inesperada ocorreu: {e}")

if __name__ == "__main__":
    run_consumer()