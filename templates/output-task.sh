#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

OUTPUT_NAME=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/TEST_NAME_WITH_UNDERSCORES/test.yml --print-bodies=true | sed '$d' | jq -r RESPONSE_PATH)
export OUTPUT_NAME

write_env_vars_to_file

post_to_datadog 1
