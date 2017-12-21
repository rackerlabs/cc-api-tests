#!/bin/bash

props="cc-api-tests-bucket/${PIPELINE}.txt"
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
