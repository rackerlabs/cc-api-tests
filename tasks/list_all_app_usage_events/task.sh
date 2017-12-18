#!/bin/sh
set -eu

props="keyval/keyval.properties"
if [ -f "$props" ]
then
  echo "Reading passed key values"
  while IFS= read -r var
  do
    if [ ! -z "$var" ]
    then
      echo "Adding: $var"
      export "$var"
    fi
  done < "$props"
fi

pyresttest https://$CF_API_URL cc-api-tests/tasks/list_all_app_usage_events/test.yml