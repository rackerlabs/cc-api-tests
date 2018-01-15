#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_SOURCE_APP_GUID=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/creating_a_source_app/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_SOURCE_APP_GUID

write_env_vars_to_file

post_to_datadog 1
