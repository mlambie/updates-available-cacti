#!/bin/bash
UPDATE_MOTD="/usr/lib/update-notifier/update-motd-updates-available"
UPDATE_AVAIL="/var/lib/update-notifier/updates-available"

if [ -x "$UPDATE_MOTD" ]; then
  ${UPDATE_MOTD} > /dev/null 2>&1
fi

if [ -e "$UPDATE_AVAIL" ]; then
  UA_TOTAL="$(cat ${UPDATE_AVAIL} | grep "can be updated." | cut -f1 -d" ")"
  UA_SEC="$(cat ${UPDATE_AVAIL} | grep "security updates" | cut -f1 -d" ")"  
fi

[ -z $UA_TOTAL ] && UA_TOTAL=0
[ -z $UA_SEC ] && UA_SEC=0
UA_NONSEC="$(($UA_TOTAL - $UA_SEC))"
printf "${UA_TOTAL}\n${UA_SEC}\n${UA_NONSEC}\n"
