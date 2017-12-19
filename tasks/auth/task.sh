#!/bin/sh
set -eu

source cc-api-tests/functions/functions.sh

export CF_AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml --print-bodies=true | sed '$d' | jq -r .access_token)

write_env_vars_to_file
