#!/bin/sh
set -e

# Ensure /data dirs exist (Render mounts persistent disk at runtime)
mkdir -p /data/.clawdbot /data/workspace

# Start gateway — runs as root inside Render's isolated container
exec node /app/dist/index.js gateway --bind lan --port 10000 --allow-unconfigured --verbose
