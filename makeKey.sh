#!/bin/sh

host=$1
if [ -z $host ]; then
	echo "no host specified. exiting"
	exit
fi

ssh-keygen -t rsa -f $host
