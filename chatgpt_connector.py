import openai
from flask import Flask, request, jsonify

# Nastav API klíč
openai.api_key = "TVŮJ_OPENAI_API_KLÍČ"

# Vytvoření Flask serveru
app = Flask(__name__)

@app.route('/chat', methods=['POST'])
def chat():
    data = request.get_json()
    user_input = data.get("input", "")

    try:
        # Odeslání požadavku na OpenAI API
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",  # nebo jiný model
            messages=[
                {"role": "system", "content": "Jsi český hlasový asistent."},
                {"role": "user", "content": user_input}
            ]
        )
        # Získání odpovědi
        reply = response['choices'][0]['message']['content']
        return jsonify({"response": reply})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5005)
