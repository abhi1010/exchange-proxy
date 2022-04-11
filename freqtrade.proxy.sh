#!/usr/bin/env bash

kill_by_id() {
if [ $# -eq 1 ];
then
    echo -e "KILLING $1"
    kill -9 $1
fi
}

ID=$( ps -ef | egrep dist.freqtrade.proxy | ag -v grep  | awk '{print $2}')
kill_by_id $ID
nohup /home/abhishek.pandey/code/crypto/freqtrade-proxy/dist/freqtrade-proxy -port 6001 -verbose 1 > /tmp/proxy.log 2>&1 &

