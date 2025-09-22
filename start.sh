#!/bin/bash
set -o errexit
set -o xtrace

# Download latest rclone
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip -o rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
cp rclone /app/bin/
cd ..

# Check rclone
/app/bin/rclone version

# Keep dyno alive (1 hour loop)
while true; do
  echo "Rclone running..."
  sleep 300
done
