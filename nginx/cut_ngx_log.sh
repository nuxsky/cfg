#!/bin/sh
# v1.0.1

DATE=`date +%Y%m%d`
NGXBIN=/usr/local/nginx
NGXLOG=/data/logs/nginx

[ -d $NGXLOG ] && cd $NGXLOG || exit 1
for LOGNAME in `ls $NGXLOG | grep -v "[^0-9].log"`
do
  mv $LOGNAME ${LOGNAME%%.*}_$DATE.log
done

$NGXBIN/sbin/nginx -s reload
find $NGXLOG -mtime +30 -type f -exec mv {} /tmp \;