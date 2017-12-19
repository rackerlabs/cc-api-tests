#!/bin/bash
set -eu

source cc-api-tests/functions/functions.sh

read_env_vars_from_file

export CF_APP_USAGE_EVENT_GUID=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/list_all_app_usage_events/test.yml | sed '$d' | jq -r .resources[0].metadata.guid)

write_env_vars_to_file
