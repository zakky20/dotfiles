#!/usr/bin/env bash

backups=$HOME/.config/backup.txt
dateup=$(cat $backups)
let current=$(date +%s)
timestamp5=$(date -d "$dateup" +%s)
backup_checker=$((current - timestamp5))
backuper=$((backup_checker/ 86400))


echo $backuper Days Since Last Backup
