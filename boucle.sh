#!/bin/bash

if [ "Z$1" = "Z" ] ; then
    echo "manque parametre"
    exit 1
fi

LASTDATE="1234"
CURDATE="1234"

while [ 1 ] ; do
    make $1
    if [ -e "$1" ] ; then
        CURDATE=$(date -r $1 +%s)
    fi

    if [ "Z$CURDATE" != "Z$LASTDATE" ] ; then
#        pkill evince
        LASTDATE=$CURDATE
        evince $1 &
    fi
    sleep 2
done
