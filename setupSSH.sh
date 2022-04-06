#!/bin/sh

host=$1
if [ -z $host ]; then
	echo "no host specified."
	exit
elif ! [ -f "$host.pub" ]; then
	echo "no public key for that host."
	exit
elif ! [ -f "$host" ]; then
	echo "no private key for that host."
	exit
fi

sshDir="$HOME/.ssh"
if ! [ -d $sshDir ]; then
	mkdir $sshDir
fi
chmod 700 $sshDir

cat $host > $sshDir/id_rsa
chmod 600 $sshDir/id_rsa
cat $host.pub > $sshDir/id_rsa.pub
chmod 644 $sshDir/id_rsa.pub

if [ -f "$sshDir/knownHosts" ]; then
	rm "$sshDir/knownHosts"
fi

#if [ -f "$sshDir/authorized_keys" ]; then
cat $host.authorisedKeys > "$sshDir/authorized_keys"
#fi
