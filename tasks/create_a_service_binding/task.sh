#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_SERVICE_BINDING_GUID=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/create_a_service_binding/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_SERVICE_BINDING_GUID

write_env_vars_to_file

post_to_datadog 1
