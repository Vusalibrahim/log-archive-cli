#!/usr/bin/env bash
set -e

if [[ ! -f log-archive ]]; then
  echo "Error: log-archive script not found"
  exit 1
fi

sudo cp log-archive /usr/local/bin/log-archive
sudo chmod +x /usr/local/bin/log-archive

echo "✔ log-archive installed successfully"
echo "Run: log-archive /var/log"