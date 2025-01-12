ARG BUILD_FROM
FROM $BUILD_FROM

# Instalace potřebných balíčků
RUN \
    apk add --no-cache \
        python3 \
        py3-pip \
        gcc \
        python3-dev \
        musl-dev \
        libffi-dev

# Nastavení pracovního adresáře
WORKDIR /usr/src/app

# Kopírování souborů
COPY requirements.txt .
COPY run.sh .
COPY chatgpt_connector.py .

# Instalace závislostí
RUN \
    pip3 install --no-cache-dir -r requirements.txt \
    && rm -rf /root/.cache/pip

# Nastavení oprávnění pro run.sh
RUN chmod a+x run.sh

# Spuštění
CMD [ "./run.sh" ]
