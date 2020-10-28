#!/bin/bash

filelist=$(ls)

current_dic=$(pwd)

for file in ${filelist[@]}; do
    java -classpath :/usr/lib/zookeeper/lib/slf4j-api-1.6.1.jar:/usr/lib/zookeeper/zookeeper-3.4.5-cdh4.7.0.jar org.apache.zookeeper.server.LogFormatter ${current_dic}/${file} | grep /NS/udb/set9002/UDBSentinelV2/leader
done
