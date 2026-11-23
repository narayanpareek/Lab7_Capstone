#!/bin/bash

SOURCE="$1"
DEST="$2"

if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
    echo "Usage: ./backup.sh source_directory destination_directory"
    exit 1
fi

if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory does not exist"
    exit 1
fi

mkdir -p "$DEST" || {
    echo "Error: Cannot create destination directory"
    exit 1
}

ARCHIVE="$DEST/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

if tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
    echo "Backup completed successfully"
    echo "Backup saved at: $ARCHIVE"
else
    echo "Error: Backup failed"
    exit 1
fi

echo ""
echo "To restore, use:"
echo "tar -xzf \"$ARCHIVE\" -C restore_directory"
