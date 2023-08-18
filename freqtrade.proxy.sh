#!/usr/bin/env bash

kill_by_id() {
if [ $# -eq 1 ];
then
    echo -e "KILLING $1"
    kill -9 $1
fi
}


APP=freqtrade.proxy
APP=exchange-proxy

ID=$( ps -ef | egrep dist.$APP | ag -v grep  | awk '{print $2}')
kill_by_id $ID
# /Users/abhi/code/crypto/freqtrade-proxy/dist/$APP -port 6001 -verbose 1
nohup /Users/abhi/code/crypto/freqtrade-proxy/dist/$APP -port 6001 -verbose 1 > /tmp/proxy.log 2>&1 &

