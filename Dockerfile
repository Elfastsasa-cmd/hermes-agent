FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
ENV HERMES_HOME=/opt/data

WORKDIR /opt/hermes

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --no-cache-dir -e ".[core]" || \
    pip install --no-cache-dir -e "." 

CMD ["python", "-m", "hermes_cli.gateway"]
