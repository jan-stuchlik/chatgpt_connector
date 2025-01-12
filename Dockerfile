ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.11-alpine3.16
FROM ${BUILD_FROM}

# Nastavení pracovního adresáře
WORKDIR /usr/src/app

# Kopírování souborů
COPY . .

# Instalace závislostí
RUN \
    apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Nastavení oprávnění pro run.sh
RUN chmod a+x run.sh

# Spuštění
CMD [ "/usr/src/app/run.sh" ]

# Označení portu
EXPOSE 5005
