#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

curl -v -k -X PUT -H "Authorization: bearer $AUTH_TOKEN" -F "=droplet@cc-api-tests/fixtures/droplet/droplet.tgz" https://$CF_API_URL/v2/apps/$CF_APP_GUID/droplet/upload

post_to_datadog 1
