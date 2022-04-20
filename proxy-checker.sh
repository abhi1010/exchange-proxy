#!/usr/bin/env bash


echo -e "---------------" >> /tmp/proxy-checker.log
echo -e $(date) >> /tmp/proxy-checker.log
startup_proxy() {
if [ $# -eq 0 ];
then
    echo -e "starting app" >> /tmp/proxy-checker.log
    echo -e "------------------" >> /tmp/proxy.log
    echo -e "starting app" >> /tmp/proxy.log
    nohup /home/abhishek.pandey/code/crypto/freqtrade-proxy/dist/exchange-proxy -port 6001 -verbose 1 >> /tmp/proxy.log 2>&1 &
else
    echo -e "App is already running" >> /tmp/proxy-checker.log
fi
}

ID=$( ps -ef | egrep dist.exchange.proxy | ag -v grep  | awk '{print $2}')
startup_proxy $ID

