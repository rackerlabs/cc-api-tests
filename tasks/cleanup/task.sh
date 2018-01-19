#!/bin/bash
set -eu

source cc-api-tests/util/read_env_vars_from_file.sh

curl -k -H "Authorization: bearer $AUTH_TOKEN" -X DELETE "https://$CF_API_URL/v2/organizations/$CF_ORGANIZATION_GUID?recursive=true"
