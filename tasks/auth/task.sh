#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh

AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml --print-bodies=true | sed '$d' | jq -r .access_token)
export AUTH_TOKEN

echo "AUTH_TOKEN=${AUTH_TOKEN}" >> "${OUTPUT}/${PIPELINE}.txt"
