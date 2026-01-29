#!/bin/sh
# Ensure /data dirs exist and are writable by node user (uid 1000)
# Render mounts the persistent disk at runtime as root, so we must fix perms here
mkdir -p /data/.clawdbot /data/workspace
chown -R node:node /data

# Drop to node user and start the gateway
exec su -s /bin/sh node -c "node /app/dist/index.js gateway --bind lan --port 10000 --allow-unconfigured --verbose"
