#!/bin/bash
export HERMES_HOME=/opt/data
mkdir -p /opt/data/{cron,sessions,logs,hooks,memories,skills}

# Copy configs if not exist
[ ! -f /opt/data/.env ] && cp /opt/hermes/.env.example /opt/data/.env
[ ! -f /opt/data/config.yaml ] && cp /opt/hermes/cli-config.yaml.example /opt/data/config.yaml

# Start gateway directly tanpa systemctl
python -m hermes_cli.gateway start --no-daemon
