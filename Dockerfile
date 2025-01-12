ARG BUILD_FROM
FROM $BUILD_FROM

# Instalace potřebných balíčků
WORKDIR /usr/src/app
COPY requirements.txt .
COPY run.sh .
COPY chatgpt_connector.py .

# Instalace závislostí
RUN pip3 install -r requirements.txt

# Nastavení oprávnění pro run.sh
RUN chmod a+x run.sh

# Spuštění
CMD [ "./run.sh" ]
