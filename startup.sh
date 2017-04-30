#!/bin/bash
docker run -d -p 444:44444 -p 41660:22 -p 41661:50070 sumit/flume:latest

#####attach to docker container
#ssh hduser@192.168.1.101 -p 444
#start hadoop
#sbin/start-all.sh
#start flume
#/usr/local/flume/bin/start-flume.sh
