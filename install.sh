#!/bin/bash

yum install lua-devel readline-devel pcre-devel gcc perl-Digest-* zlib-devel -y

SECONDS=0

gmake install
cp ./openresty /usr/local/openresty -Rv
rm -f /usr/lib/systemd/system/openresty.service
cp ./util/openresty.service /usr/lib/systemd/system/ -v
rm -f /usr/local/bin/openresty
ln -s /usr/local/openresty/bin/openresty /usr/local/bin/openresty
rm -rf /usr/local/openresty/nginx/conf/nginx.conf
cp ./util/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
systemctl daemon-reload
systemctl enable openresty

mkdir -p /var/log/nginx
touch /var/log/nginx/access.log
touch /var/log/nginx/error.log
chown nobody:nobody -Rv /var/log/nginx
chmod 666 /var/log/nginx/*

if (( $SECONDS > 3600 )) ; then
    let "hours=SECONDS/3600"
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Completed in $hours hour(s), $minutes minute(s) and $seconds second(s)" 
elif (( $SECONDS > 60 )) ; then
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Completed in $minutes minute(s) and $seconds second(s)"
else
    echo "Completed in $SECONDS seconds"
fi
