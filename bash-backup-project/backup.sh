#!/bin/bash

BACKUP_DIR="backups"
LOG_FILE="backup.log"
DATE=$(date +%Y-%m=%d)
TIME=$(date +%H:%M:%S)

# log function
log() {
    local MSG="$1"
    echo "[$DATE $TIME] $MSG" | tee -a "$LOG_FILE"
}

# source path input
read -p "Enter the path of the dir or file you want to backup: " SOURCE_PATH
SOURCE_PATH=$(echo "$SOURCE_PATH" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# chick if sourch exists
if [ ! -e "$SOURCE_PATH" ];
then
    log "[ERROR]  the path '$SOURCE_PATH' does not exist."
    exit 1
fi

# extract name for use in the output name
NAME=$(basename "$SOURCE_PATH")
FILENAME="backup_${NAME}_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"
if [ $? -ne 0 ]; 
then
    log "[ERROR] Cannot create backup directory: $BACKUP_DIR"
    # echo "Error creating backup folder: $BACKUP_DIR"
    exit 1
fi

# create backup file
tar -czf "$BACKUP_DIR/$FILENAME" "$SOURCE_PATH"
tar_status=$?

if [ $tar_status -ne 0 ];
then
    log "[ERROR] Backup failed. please check permissions."
    # echo 'Error in taking backup. Please check the paths and permissions.'
    exit 1 
fi

if [ $? -eq 0 ];
then
    log "[DONE] Backup successfully created: $BACKUP_DIR/$FILENAME"
    # echo "The backup was successfully taken: $BACKUP_DIR/$FILENAME"
fi
