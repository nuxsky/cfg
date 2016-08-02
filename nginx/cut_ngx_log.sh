#!/bin/sh
# v1.0.0

DATE=`date +%Y%m%d`
NGXBIN=/usr/local/nginx
NGXLOG=/data/logs/nginx

[ -d $NGXLOG ] && cd $NGXLOG || exit 1
for LOGNAME in `ls $NGXLOG | grep "[^0-9_].log"`
do
  mv $LOGNAME ${LOGNAME%%.*}_$DATE.log
done

$NGXBIN/sbin/nginx -s reload
find $NGXLOG -mtime +30 -type f -exec mv {} /tmp \;