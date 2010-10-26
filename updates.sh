#!/bin/bash
UPDATE="/usr/lib/update-notifier/update-motd-updates-available"
TOTAL=0
SEC=0
NONSEC=0

if [ -x $UPDATE ]; then
  TOTAL="$(${UPDATE} | grep "packages can be updated." | cut -f1 -d" ")"
  [ -z $TOTAL ] && TOTAL=0
  SEC="$(${UPDATE} | grep "updates are security updates." | cut -f1 -d" ")"  
  [ -z $SEC ] && SEC=0
  NONSEC="$(($TOTAL - $SEC))"
fi
echo "total:${TOTAL} sec:${SEC} nonsec:${NONSEC}"
