#!/bin/sh
set -eu

props="cc-api-tests-bucket/app-usage-events.txt"
if [ -f "$props" ]
then
  echo "Reading passed key values"
  while IFS= read -r var
  do
    if [ ! -z "$var" ]
    then
      export "$var"
    fi
  done < "$props"
fi

export CF_APP_USAGE_EVENT_GUID=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/list_all_app_usage_events/test.yml | sed '$d' | jq -r .resources[0].metadata.guid)
echo "CF_APP_USAGE_EVENT_GUID=${CF_APP_USAGE_EVENT_GUID}" >> cc-api-tests-put-bucket/app-usage-events.txt
