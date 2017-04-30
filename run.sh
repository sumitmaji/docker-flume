#!/bin/bash
su - hduser -c "/usr/local/hadoop/sbin/start-all.sh"
su - hduser -c "/usr/local/flume/bin/start-flume.sh"
