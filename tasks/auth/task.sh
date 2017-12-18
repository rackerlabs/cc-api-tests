#!/bin/sh
set -eu

apk update
apk add jq

export CF_AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml | jq -r .access_token)

echo "CF_AUTH_TOKEN=${CF_AUTH_TOKEN}" >> keyvalout/keyval.properties
