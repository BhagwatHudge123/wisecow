#!/bin/bash

LOG_FILE="/home/ubuntu/S3_bkp_logs.log"
BACKUP_SRC="/home/ubuntu/wisecow"          
BACKUP_DEST="/home/ubuntu/S3_bkps/wisecow_backup_$(date +%F-%H%M%S).tar.gz"
S3_BUCKET="s3://wisecow-bkp"   
 

echo "===== uploading backup file into s3 =====" | tee -a $S3_bkp_logs
tar -czf $BACKUP_DEST $BACKUP_SRC
if [ $? -eq 0 ]; then
  echo "Backup created at $BACKUP_DEST" | tee -a $S3_bkp_logs
  aws s3 cp $BACKUP_DEST $S3_BUCKET/
  if [ $? -eq 0 ]; then
    echo "Backup file successfully uploaded to $S3_BUCKET" | tee -a $S3_bkp_logs
  else
    echo "ERROR: S3 upload failed" | tee -a $S3_bkp_logs
  fi
else
  echo "ERROR: Backup failed" | tee -a $S3_bkp_logs
fi
