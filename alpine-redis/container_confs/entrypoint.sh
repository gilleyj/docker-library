#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for container
# ----------------------------------------------------------------------------
set -e
HOST_IP=`/bin/grep $HOSTNAME /etc/hosts | /usr/bin/cut -f1`
echo "started with ip: ${HOST_IP}..."

if [ "$1" == "redis" ]; then
	echo "starting redis with...."
	echo /usr/bin/redis-server --loglevel verbose --portected-mode no
	/usr/bin/redis-server --loglevel verbose --portected-mode no
elif [ "$1" == "bash" ] || [ "$1" == "shell" ]; then
	echo "starting /bin/bash...."
	/bin/bash --rcfile /etc/bashrc
else
	echo "Running something else"
	exec "$@"
fi
