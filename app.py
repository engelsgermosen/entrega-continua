from flask import Flask

app = Flask(__name__)

@app.get("/")
def home():
    return "¡Hola mundo desde Flask + Docker! 👋"

if __name__ == "__main__":
    # Para correr local sin docker (opcional)
    app.run(host="0.0.0.0", port=8080)
