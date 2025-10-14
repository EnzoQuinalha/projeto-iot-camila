# Projeto de Integração IoT: MQTT, MySQL e API REST

![Python](https://img.shields.io/badge/python-3.10+-blue.svg)
![FastAPI](https://img.shields.io/badge/FastAPI-0.103.2-009688.svg)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-2.0-blue.svg)
![Paho-MQTT](https://img.shields.io/badge/Paho--MQTT-1.6.1-red.svg)

Projeto desenvolvido para a disciplina de Internet das Coisas (IoT), que implementa uma solução completa para coletar dados da **Bancada Didática 4.0 – Nível 1 (Camila)**. Os dados são consumidos via MQTT, persistidos em um banco de dados MySQL e expostos através de uma API RESTful construída com FastAPI.

## 🏛️ Arquitetura do Sistema

O fluxo de dados do projeto segue a seguinte arquitetura:

`Bancada Didática (Publisher) -> Broker MQTT (HiveMQ Cloud) -> Consumidor Python (Paho-MQTT) -> Banco de Dados (MySQL) -> API REST (FastAPI) -> Cliente (Navegador/Swagger)`

## ✨ Funcionalidades Principais

* **Consumidor MQTT:** Um serviço robusto que se conecta de forma segura (TLS/SSL) a um broker MQTT, se inscreve em tópicos e processa as mensagens recebidas em tempo real.
* **Processamento Inteligente:** A lógica do consumidor diferencia os tipos de dados recebidos (numéricos como temperatura/umidade e textuais como status de qualidade), tratando e armazenando-os adequadamente.
* **Persistência de Dados:** Utiliza SQLAlchemy para mapear os dados recebidos para tabelas em um banco de dados MySQL, garantindo a integridade e a estruturação das informações.
* **API RESTful:** Uma API desenvolvida com FastAPI que expõe os dados armazenados através de endpoints claros e bem definidos.
* **Documentação Automática:** A API conta com uma documentação interativa e didática gerada automaticamente pelo Swagger UI, facilitando os testes e o uso.

## 🛠️ Tecnologias Utilizadas

| Ferramenta         | Versão/Tipo     | Descrição                                         |
| ------------------ | --------------- | ------------------------------------------------- |
| **Linguagem** | Python 3.10+    | Base de todo o desenvolvimento.                   |
| **API Framework** | FastAPI         | Para a construção da API RESTful de alta performance. |
| **ORM** | SQLAlchemy      | Para a comunicação com o banco de dados MySQL.      |
| **Cliente MQTT** | Paho-MQTT       | Para a conexão com o broker e consumo de mensagens. |
| **Banco de Dados** | MySQL           | Para o armazenamento persistente dos dados.         |
| **Servidor API** | Uvicorn         | Para rodar a aplicação FastAPI.                   |
| **Variáveis de Ambiente** | python-dotenv | Para gerenciar credenciais de forma segura.        |
| **Validação** | Pydantic        | Utilizado pelo FastAPI para validar dados.        |

## 🚀 Como Rodar o Projeto

Siga os passos abaixo para configurar e executar o projeto em seu ambiente local.

### 1. Pré-requisitos

* Python 3.10 ou superior
* Git
* Um servidor MySQL em execução
* Um broker MQTT (o projeto está configurado para o HiveMQ Cloud, mas pode ser adaptado)

### 2. Instalação

```bash
# 1. Clone o repositório
git clone [https://github.com/EnzoQuinalha/projeto-iot-camila.git](https://github.com/EnzoQuinalha/projeto-iot-camila.git)
cd projeto-iot-camila

# 2. Crie e ative um ambiente virtual
python -m venv venv
# No Windows:
# venv\Scripts\activate
# No Linux/macOS:
# source venv/bin/activate

# 3. Instale as dependências do projeto
pip install -r requirements.txt
```

### 3. Configuração

1.  **Banco de Dados:**
    * Acesse seu servidor MySQL como `root`.
    * Crie o banco de dados e o usuário que a aplicação irá utilizar:
        ```sql
        CREATE DATABASE iot_camila_db;
        CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
        GRANT ALL PRIVILEGES ON iot_camila_db.* TO 'admin'@'localhost';
        FLUSH PRIVILEGES;
        ```

2.  **Variáveis de Ambiente:**
    * Renomeie o arquivo `.env.example` (se houver) para `.env` ou crie um novo.
    * Preencha o arquivo `.env` com suas credenciais:
        ```ini
        # Configuração do Banco de Dados
        DB_HOST="localhost"
        DB_USER="admin"
        DB_PSWD="admin"
        DB_NAME="iot_camila_db"

        # Variáveis do Broker MQTT (Ex: HiveMQ Cloud)
        MQTT_BROKER="seu-broker-host.s1.eu.hivemq.cloud"
        MQTT_PORT=8883
        MQTT_USER="seu-usuario-mqtt"
        MQTT_PSWD="sua-senha-mqtt"
        MQTT_TOPIC="#"
        ```

### 4. Execução

O sistema precisa de dois terminais rodando simultaneamente.

**Terminal 1: Iniciar o Consumidor MQTT**
(Este terminal ficará "ouvindo" as mensagens da bancada e salvando no banco)
```bash
python mqtt_consumer/consumer.py
```

**Terminal 2: Iniciar a API REST**
(Este terminal irá "servir" os dados para consulta)
```bash
uvicorn app.main:app --reload
```
A API estará disponível em `http://127.0.0.1:8000`.

## 📖 Uso da API

Acesse a documentação interativa completa em [**http://127.0.0.1:8000/docs**](http://127.0.0.1:8000/docs).

### Exemplos de Rotas

#### 1. `GET /data/sensors`
Retorna os últimos registros de **todos** os sensores.

**Exemplo de Resposta:**
```json
[
  {
    "id": 1,
    "topic": "smart40n1/temperatura",
    "value": 25.5,
    "unit": "°C",
    "timestamp": "2025-10-14T12:30:00"
  },
  {
    "id": 2,
    "topic": "smart40n1/umidade",
    "value": 65,
    "unit": "%",
    "timestamp": "2025-10-14T12:30:15"
  }
]
```

#### 2. `GET /data/sensors/temperatura`
Retorna apenas os registros de **temperatura**.

**Exemplo de Resposta:**
```json
[
  {
    "id": 1,
    "topic": "smart40n1/temperatura",
    "value": 25.5,
    "unit": "°C",
    "timestamp": "2025-10-14T12:30:00"
  }
]
```
