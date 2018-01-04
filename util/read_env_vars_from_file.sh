#!/bin/bash

props=$(find . -name ${PIPELINE}.txt -exec cat {} \;)
while IFS= read -r var
do
    if [ ! -z "$var" ]
    then
	export $var
    fi
done <<< "$props"
