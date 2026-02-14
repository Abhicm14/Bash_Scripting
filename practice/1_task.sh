#! /bin/bash

if [ $# -lt 1 ];
then
	echo "Usage: $0 hostname" >&2
	exit 1
fi

host=$1

if ping -c1 -W1 "$host" > /dev/null 2>&1;
then
	echo "Host '$host' is up"
else
	echo "Host '$host' is down"
fi

