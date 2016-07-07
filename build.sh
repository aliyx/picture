#!/bin/bash
if [ $1 == "local" -a $1 == "sit" -a $1 == "pre" -a $1 == "prod" ]; then
    echo "Invalid environment: $1"
    exit
fi

TFS_SERVER=
REDIS_SERVER=
REDIS_SERVER_DUBBO_WRITE=
HTTP_SERVER=
HTTP_PORT=10502

#inet addr:ip
ip_command=`ifconfig eth0 | grep 'inet addr' | awk '{ print $2}' | awk -F: '{print $2}'`
HTTP_SERVER=`echo $ip_command`

#inet ip
if [ -z "$HTTP_SERVER" ]; then
    ip_command=`ifconfig eth0 | grep 'inet ' | awk '{ print $2}'`
    HTTP_SERVER=`echo $ip_command`
fi

if [ -z "$HTTP_SERVER" ]; then
    echo "Can not get the local ip address!"
    exit
fi

# local or sit env
if [ $1 == "local" -o $1 == "sit" ]; then   
    TFS_SERVER="10.213.33.177:11100"
    REDIS_SERVER="10.213.33.155:10388"
    REDIS_SERVER_DUBBO_WRITE="10.77.135.117:16379"
fi

if [ $1 == "pre" ]; then
    echo "unknow"    
fi

if [ -z "$TFS_SERVER" -o -z "$REDIS_SERVER" -o -z "$REDIS_SERVER_DUBBO_WRITE" ]; then
    echo "Invalid environment: $1"
    exit
fi

#set lua_package_path
sed -ri "s/(.*)lua_package_path(.*)\?\.(.*)/\1lua_package_path \"\/var\/wd\/wrs\/webroot\/picture\/?.\3/g" nginx.conf

# set http port
sed -ri "s/(.*)listen\s+80/\1listen $HTTP_PORT/g" nginx.conf

##According to port match

#redis server
sed -ri "s/(.*)server\s*(([0-9]+\.){3}[0-9]+):10388(.*)/\1server $REDIS_SERVER\4/g" nginx.conf

#tfs server
sed -ri "s/(.*)server\s*(([0-9]+\.){3}[0-9]+):11100/\1server $TFS_SERVER/g" nginx.conf

#http server
sed -ri "s/(.*)server_name\s*(([0-9]+\.){3}[0-9]+).*/\1server_name $HTTP_SERVER;/g" nginx.conf

#redis double write server
sed -ri "s/(.*)redis2_pass\s*(([0-9]+\.){3}[0-9]+):16379(.*)/\1redis2_pass $REDIS_SERVER_DUBBO_WRITE\4/g" nginx.conf


echo "tfs_server: $TFS_SERVER"
echo "redis_server: $REDIS_SERVER"
echo "redis_server_dubbo_write: $REDIS_SERVER_DUBBO_WRITE"
echo "http_server: $HTTP_SERVER"
