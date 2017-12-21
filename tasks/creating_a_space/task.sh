#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

export CF_SPACE_GUID=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/creating_a_space/test.yml | sed '$d' | jq -r .metadata.guid)

write_env_vars_to_file