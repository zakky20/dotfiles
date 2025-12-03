#!/usr/bin/env bash

time1="10/25/2025 8:00AM"
let current=$(date +%s)
timestamp1=$(date -d "$time1" +%s)
time_progression=$((current - timestamp1))
days_done=$((time_progression / 86400))
echo $days_done
