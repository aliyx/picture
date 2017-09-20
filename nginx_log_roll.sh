#!/bin/bash

logs_path="/usr/local/tengine/logs/"
access="access"   
error="error"

pid_path="/${logs_path}nginx.pid"

mv ${logs_path}${access}.log ${logs_path}$(date +%Y-%m-%d)-${access}.log
mv ${logs_path}${error}.log ${logs_path}$(date +%Y-%m-%d)-${error}.log

kill -USR1 `cat ${pid_path}`

# crontab  -e
# 01 01 * * 1 /var/wd/wrs/webroot/picture/nginx_log_roll