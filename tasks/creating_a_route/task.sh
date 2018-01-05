#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_ROUTE_GUID=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/creating_a_route/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_ROUTE_GUID

write_env_vars_to_file
