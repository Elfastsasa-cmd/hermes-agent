#!/bin/bash
set -e
export HERMES_HOME=/opt/data

mkdir -p /opt/data/{cron,sessions,logs,hooks,memories,skills}

[ ! -f /opt/data/.env ] && cp /opt/hermes/.env.example /opt/data/.env
[ ! -f /opt/data/config.yaml ] && cp /opt/hermes/cli-config.yaml.example /opt/data/config.yaml

echo "=== Starting Hermes Gateway ==="
echo "TELEGRAM_BOT_TOKEN set: ${TELEGRAM_BOT_TOKEN:+yes}"
echo "TELEGRAM_ALLOWED_USERS: $TELEGRAM_ALLOWED_USERS"

exec hermes gateway start
