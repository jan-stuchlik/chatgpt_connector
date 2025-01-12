ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.11-alpine3.16
FROM ${BUILD_FROM}

# Kopírování souborů
WORKDIR /usr/src/app
COPY requirements.txt .
COPY run.sh .
COPY chatgpt_connector.py .

# Instalace závislostí
RUN \
    pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Nastavení oprávnění pro run.sh
RUN chmod a+x run.sh

# Spuštění
CMD [ "./run.sh" ]
