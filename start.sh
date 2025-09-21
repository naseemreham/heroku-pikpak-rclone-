#!/usr/bin/env bash
set -e

# .rclone.conf बनाओ (env vars से)
cat > /app/.rclone.conf <<EOF
[pikpak]
type = pikpak
user = ${PIKPAK_USER}
pass = ${PIKPAK_PASS}

[gdrive]
type = drive
token = ${GDRIVE_TOKEN}
EOF

# Rclone copy चलाओ
rclone copy "pikpak:${FOLDER_PATH}" "gdrive:${DEST_PATH}" --config /app/.rclone.conf --progress
