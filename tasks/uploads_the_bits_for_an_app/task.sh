#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

cd cc-api-tests/fixtures/static-site
zip -r ../../../application.zip ./
cd -

curl -v -k -X PUT -H "Authorization: bearer $AUTH_TOKEN" -F 'resources=[]' -F "application=@application.zip" https://$CF_API_URL/v2/apps/$CF_APP_GUID/bits

post_to_datadog 1
