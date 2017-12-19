#!/bin/sh
set -eu

export CF_AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml --print-bodies=true | sed '$d' | jq -r .access_token)

props="cc-api-tests-put-bucket/app-usage-events.txt"
echo "Setting key values for next job"
while IFS='=' read -r name value ; do
    if [[ $name == 'CF_'* ]]; then
	echo "Adding: ${name}"
    fi
done < <(env)
