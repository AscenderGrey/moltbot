#!/bin/sh
set -e

# Render mounts /data as root at runtime — fix ownership for node user
mkdir -p /data/.clawdbot /data/workspace
chown -R node:node /data

# Use gosu if available, otherwise su with preserved env (-m flag)
# -m preserves environment so CLAWDBOT_GATEWAY_TOKEN and other vars pass through
exec su -m -s /bin/sh node -c 'exec node /app/dist/index.js gateway --bind lan --port 10000 --allow-unconfigured --verbose'
