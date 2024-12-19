#!/bin/bash

SRC="/path/to/source"
DEST="/path/to/backup"
LOGFILE="/var/log/backup.log"

rsync -av --delete "$SRC" "$DEST" &>> "$LOGFILE"

if [[ $? -eq 0 ]]; then
  echo "Backup completed successfully at $(date)" >> "$LOGFILE"
else
  echo "Backup failed at $(date)" >> "$LOGFILE"
fi
