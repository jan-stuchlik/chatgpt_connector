import openai
from flask import Flask, request, jsonify
import os
from hassio_api import get_config

# Získání konfigurace z Home Assistant
config = get_config()
openai.api_key = config.get('openai_api_key')
system_prompt = config.get('system_prompt', 'Jsi český hlasový asistent.')
model = config.get('model', 'gpt-3.5-turbo')

app = Flask(__name__)

@app.route('/chat', methods=['POST'])
def chat():
    if not openai.api_key:
        return jsonify({"error": "OpenAI API klíč není nastaven"}), 500

    data = request.get_json()
    user_input = data.get("input", "")

    try:
        response = openai.ChatCompletion.create(
            model=model,
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_input}
            ]
        )
        reply = response['choices'][0]['message']['content']
        return jsonify({"response": reply})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5005)
