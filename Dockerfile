ARG BUILD_FROM
FROM $BUILD_FROM

# Instalace potřebných balíčků
WORKDIR /usr/src/app

# Kopírování souborů
COPY requirements.txt .
COPY run.sh .
COPY chatgpt_connector.py .

# Instalace závislostí pomocí správného Python interpreteru
RUN \
    pip3 install --no-cache-dir -r requirements.txt \
    && rm -rf /root/.cache/pip

# Nastavení oprávnění pro run.sh
RUN chmod a+x run.sh

# Spuštění
CMD [ "./run.sh" ]
