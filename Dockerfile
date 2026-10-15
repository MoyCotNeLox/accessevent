FROM python:3.11-slim

WORKDIR /app

# 1. Копируем requirements.txt ИЗ КОРНЯ (он лежит рядом с Dockerfile)
COPY requirements.txt .

# 2. Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# 3. Копируем ВСЁ содержимое папки accessevent в /app
COPY accessevent/ .

COPY templates/ ./templates/

COPY static/ ./static/

EXPOSE 5000

CMD ["python", "app.py"]