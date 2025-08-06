#!/bin/bash

SOURCE_DIR="project"
BACKUP_DIR="backups"
DATE=$(date +%Y-%m=%d)
FILENAME=backup_$DATE.tar.gz

mkdir -p "$BACKUP_DIR"
if [ $? -ne 0 ]; 
then
    echo "Error creating backup folder: $BACKUP_DIR"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ];
then
    echo "source direcrory '$SOURCE_DIR' do not exist!"
    exit 1
fi

tar -czf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR"
tar_status=$?

if [ $tar_status -ne 0 ];
then
    echo 'Error in taking backup. Please check the paths and permissions.'
    exit 1 
fi

if [ $? -eq 0 ];
then 
    echo "The backup was successfully taken: $BACKUP_DIR/$FILENAME"
fi
