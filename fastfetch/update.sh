#!/usr/bin/env bash


updates=$HOME/.config/update.txt
dateup=$(cat $updates)
let current=$(date +%s)
timestamp5=$(date -d "$dateup" +%s)
update_checker=$((current - timestamp5))
updater=$((update_checker/ 86400))


echo $updater Days Since Last Update
