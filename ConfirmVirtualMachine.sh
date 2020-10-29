#!/bin/bash

IPs=$1
cpu_count=$2
mem_size=$3
disk_size=$4

if [[ -z ${IPs} ]] || [[ -z ${cpu_count} ]] || [[ -z mem_size ]] || [[ -z disk_size ]]; then
    echo "Need parameters of IPs, cpu_count, mem_size and disk_size to Confirm."
else
    iplist=($(echo "${IPs}" | tr ',' ' '))
fi

# 先把结果拿回本地, 再做校验也可以
for ip in ${iplist[@]}; do

    ssh root@${ip} ifconfig eth0 | grep inet | head -1 | awk '{print$2}' >>/tmp/confirm_info.txt
    ssh root@${ip} dmidecode | grep -A16 'Memory Device$' | grep Size | awk '{print$2}' >>/tmp/confirm_info.txt
    ssh root@${ip} cat /proc/cpuinfo | grep 'physical id' | uniq | wc -l >>/tmp/confirm_info.txt
    ssh root@${ip} fdisk -l | grep Disk | grep /dev/vdb | awk '{print$3}' >>/tmp/confirm_info.txt
done

# 每四行并做一行输出
awk '{if (NR%4!=0) ORS=" ";else ORS="\n"}1' /tmp/confirm_info.txt
