#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_SHARED_DOMAIN_GUID=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/create_a_shared_domain/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_SHARED_DOMAIN_GUID
write_env_vars_to_file

post_to_datadog 1
