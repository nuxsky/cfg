#/bin/bash
# v1.0.0
KILLPID=$(ps aux|grep "php-fpm: pool"|grep -v grep |awk '{if($4>=1)print $2}')
DATE=$(date +%F-%T)
echo $KILLPID
for PIDS in $KILLPID
do
echo $DATE  $PIDS >>/tmp/killpid.logs
kill -15 $PIDS
done