#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Error: Not enough arguments provided" >> output.txt
    exit 1
fi

NAME=$1
SURNAME=$2
GROUP=$3

echo "Welcome, $NAME $SURNAME from group $GROUP!" >> output.txt
