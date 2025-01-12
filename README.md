# chatgpt_connector
ChatGPT connector for Home Assistant

This connector is designed to connect Rhasspy to ChatGPT so that the voice control of Home Assistant can be used in any language, here specifically in Czech.

Pro Home Assistant:
1. Vytvoř nový REST command v configuration.yaml (rest_command.yaml)
2. Vytvoř automatizaci, která odesílá textový vstup (automation.yaml)
3. Otestuj script spuštěním příkazu na serveru:
curl -X POST http://<IP_ADRESA_SERVERU>:5005/chat -H "Content-Type: application/json" -d '{"input": "Jaké je dnes počasí?"}'
4. V Rhasspy nebo Home Assistantu řekni klíčové slovo a příkaz, např.: „Zapni světlo v obýváku.“


English:
For Home Assistant:
1. Create a new REST command in configuration.yaml (rest_command.yaml)
2. Create an automation that sends text input (automation.yaml)
3. Test the script by running the command on the server:
curl -X POST http://<IP_ADDRESS_SERVER>:5005/chat -H "Content-Type: application/json" -d '{"input": "What's the weather like today?"}'
4. In Rhasspy or Home Assistant, say a keyword and a command, e.g., "Turn on the living room light."
