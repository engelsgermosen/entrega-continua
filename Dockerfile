# Imagen base ligera con Python 3.12
FROM python:3.12-slim

# Evita prompts interactivos
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Crea y usa un directorio de trabajo
WORKDIR /app

# Instala dependencias del sistema (opcional, por si necesitas build tools)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl && rm -rf /var/lib/apt/lists/*

# Copia e instala deps de Python primero (mejor caché)
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copia el código
COPY . .

# Expone el puerto de Flask
EXPOSE 8080

# Comando de arranque
CMD ["python", "app.py"]
