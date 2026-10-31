if [ $# -ne 1 ]; then
echo "Usage: ./log_rotator.sh <logfile?"
exit 1
fi
LOG_FILE="$1"
if [ ! -f "$LOG_FILE" ]; then
echo "Error: Log file does not exist"
exit 1
fi
LOG_DIR=$(dirname "$LOG_FILE")
BASE_NAME=$(basename "$LOG_FILE" .log)
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$LOG_DIR/$BASE_NAME-$DATE.log"
if [ -e "$BACKUP_FILE" ]; then
echo "Error: Backup already exists: $BACKUP_FILE"
exit 1
fi
mv "$LOG_FILE" "$BACKUP_FILE"
touch "$LOG_FILE"
echo "Log rotated successfully!"
echo "Backup created: $BACKUP_FILE"
echo "New empty log created: $LOG_FILE"
find "$LOG_DIR" -maxdepth 1 -type f \
-name "$BASE_NAME-????-??-??.log" -mtime +7 -print -delete
