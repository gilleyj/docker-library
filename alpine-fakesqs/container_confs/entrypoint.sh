#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for container
# ----------------------------------------------------------------------------
set -e

HOST_IP=`/bin/grep $HOSTNAME /etc/hosts | /usr/bin/cut -f1`
if [ "$1" == "fakesqs" ]; then
	echo "starting fakesqs with...."
	echo /usr/bin/fake_sqs -v -o $HOST_IP -p 4568 --database /var/data/sqs/queues --log /proc/self/fd/1 --no-daemonize
	/usr/bin/fake_sqs -v -o $HOST_IP -p 4568 --database /var/data/sqs/queues --log /proc/self/fd/1 --no-daemonize
else
	echo "Running something else"
	exec "$@"
fi

