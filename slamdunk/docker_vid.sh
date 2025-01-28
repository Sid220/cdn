#!/usr/bin/env bash

datestamp () {
    echo "$1" | systemd-cat -t "SLAMDunk Camera Listener" -p "$2"
}

datestamp "$1 $2 of major $3, minor $4" info
if [ -n "$(docker ps -qf name=slamdunk)" ]
then
if [ "$1" == "add" ]
    then
        docker exec -u 0 slamdunk mknod "$2" c "$3" "$4"
        docker exec -u 0 slamdunk chmod -R 777 "$2"
        datestamp "Adding $2 to docker" info
    else
        docker exec -u 0 slamdunk rm "$2"
        datestamp "Removing $2 from docker" info
    fi
else
    datestamp "Docker container not running!" warning
fi

