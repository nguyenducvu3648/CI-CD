FROM python:3.10-slim

WORKDIR /app

# System deps (optional, keep minimal). Uncomment if you need git or build tools
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     git build-essential && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Gradio in container must bind to 0.0.0.0 and a known port
ENV GRADIO_SERVER_NAME=0.0.0.0
ENV GRADIO_SERVER_PORT=3000

EXPOSE 3000

CMD ["python", "app.py"]