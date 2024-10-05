#!/bin/bash
cd /app/soularr

if [[ -n "${LIDARR_API_KEY}" ]]; then
  sed -i "s|yourlidarrapikeygoeshere|${LIDARR_API_KEY}|g" config.ini
fi

if [[ -n "${LIDARR_URL}" ]]; then
  sed -i "s|http://localhost:8686|${LIDARR_URL}|g" config.ini
fi

if [[ -n "${SLSKD_API_KEY}" ]]; then
  sed -i "s|yourslskdapikeygoeshere|${SLSKD_API_KEY}|g" config.ini
fi

if [[ -n "${SLSKD_URL}" ]]; then
  sed -i "s|http://localhost:5030|${SLSKD_URL}|g" config.ini
fi

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "Starting Soularr! $dt"

if ps aux | grep "[s]oularr.py" > /dev/null; then
    echo "Soularr is already running. Exiting..."
else
    python soularr.py
fi
