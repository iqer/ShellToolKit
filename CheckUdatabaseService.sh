#!/bin/bash
IPs=${1}
  
if [ -z ${IPs} ]; then
    echo 'Need IP list'
    exit 1
fi

iplist=(`echo "${IPs}" | tr ',' ' '`)

for ip in ${iplist[@]}; do
    ssh root@${ip} "[ ! -z 'ps -ef |grep -v grep| grep udatabase' ] && ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | awk -F: '{print $2}'" >> 1.demo
done