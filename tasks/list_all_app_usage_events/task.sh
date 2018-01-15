#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_APP_USAGE_EVENT_GUID=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/list_all_app_usage_events/test.yml | sed '$d' | jq -r .resources[0].metadata.guid)
export CF_APP_USAGE_EVENT_GUID

write_env_vars_to_file
post_to_datadog 1
