#!/bin/bash
set -eu

props="cc-api-tests-bucket/app-usage-events.txt"
if [ -f "$props" ]
then
    while IFS= read -r var
    do
	if [ ! -z "$var" ]
	then
	    export $var
	fi
    done < "$props"
fi
