#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_USER_PROVIDED_SERVICE_INSTANCE_GUID=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/creating_a_user_provided_service_instance/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_USER_PROVIDED_SERVICE_INSTANCE_GUID

write_env_vars_to_file

post_to_datadog 1
