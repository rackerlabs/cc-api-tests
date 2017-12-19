#!/bin/sh
set -eu

export CF_AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml --print-bodies=true | sed '$d' | jq -r .access_token)

echo "CF_API_URL=${CF_API_URL}" >> cc-api-tests-bucket/app-usage-events.txt
echo "CF_AUTH_TOKEN=${CF_AUTH_TOKEN}" >> cc-api-tests-bucket/app-usage-events.txt
