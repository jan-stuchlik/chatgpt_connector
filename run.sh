#!/usr/bin/with-contenv bashio

# Kontrola konfigurace
if ! bashio::config.has_value 'openai_api_key'; then
    bashio::log.error "OpenAI API klíč není nastaven!"
    exit 1
fi

# Spuštění aplikace
python3 /usr/src/app/chatgpt_connector.py
