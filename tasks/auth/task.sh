#!/bin/sh
set -eu

export CF_AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml --print-bodies=true | sed '$d' | jq -r .access_token)

echo "CF_API_URL=${CF_API_URL}" >> keyvalout/keyval.properties
echo "CF_AUTH_TOKEN=${CF_AUTH_TOKEN}" >> keyvalout/keyval.properties
