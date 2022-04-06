#!/bin/sh

host=$1
if [ -z $host ]; then
	echo "no host specified. exiting"
	exit
fi

authFile="$host.authorisedKeys"
echo "" > $authFile

for key in "*.pub"; do
	if ! [ "$key" == "$host.pub" ]; then
		cat $key >> $authFile
	fi
done

