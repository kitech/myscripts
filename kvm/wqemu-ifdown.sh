#!/bin/sh
set -x

switch=br0

#/usr/bin/sudo /usr/sbin/tunctl -u `whoami` -t $1

# exit;

if [ -n "$1" ];then
    /usr/bin/sudo /sbin/ip link set $1 down
    sleep 0.5s
    /usr/bin/sudo /usr/sbin/tunctl -d $1
#        /usr/bin/sudo /usr/sbin/tunctl -u `whoami` -t $1
#	sleep 1s
#        /usr/bin/sudo /sbin/ip link set $1 up
#        sleep 0.5s
#       /usr/bin/sudo /sbin/brctl addif $switch $1
    sudo killall -9 parprouted
    exit 0
else
    echo "Error: no interface specified"
    exit 1
fi
