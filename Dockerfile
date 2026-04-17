FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
ENV HERMES_HOME=/opt/data

WORKDIR /opt/hermes

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --no-cache-dir -e ".[all]" --timeout 300 

ENV HERMES_HOME=/opt/data
RUN mkdir -p /opt/data/{cron,sessions,logs,hooks,memories,skills}
RUN chmod +x docker/entrypoint.sh

CMD ["python", "-c", "from hermes_cli.gateway import run_gateway; run_gateway()"]
