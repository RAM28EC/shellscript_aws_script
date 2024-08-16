#!/bin/bash
backup_config_file="/archive/backup_file.txt"
backup_destination="/member"
#hourly_backup="$backup_destination/$(date +`%Y-%m-%d_%H-%M`)"
backup_filename="backup_$(date +`%Y-%m-%d_%H-%M`)"
source_directory="/archive"
#check if the backup configuration file exists
if [ -f "$back_config_file" ];
then
 echo "backup configuartion file exist.proceed backup"
else
 echo "backup configuration file not found"
exit 1
fi
# mkdir -p $hourly_backup
#read backup configuation file(modify as per your file format)
source $backup_config_file
#perform the backup
tar -czf $backup_destination/$backup_filename "$source_directory" 2>/dev/null
#check if backup was successful
if [ $? -eq 0 ];
then
 echo "backup compeleted successfully: $backup_destination/$backup_filename"
else
 echo "backup failed please check errors"
exit 1
fi   

