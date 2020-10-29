#!/bin/bash
IPs=${1}

if [ -z ${IPs} ]; then
    echo 'Need IP list'
    exit 1
fi

iplist=($(echo "${IPs}" | tr ',' ' '))

for ip in ${iplist[@]}; do
    ssh root@${ip} "ps -ef |grep -v grep| grep udatabase && ifconfig eth0 | grep inet | head -1 | awk '{print$2}'" >> /tmp/ServiceStatus.output
done
