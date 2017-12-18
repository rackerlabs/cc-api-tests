#!/bin/sh
set -eu

apk update
apk add py-curl py-yaml curl-dev build-base jq
export PYCURL_SSL_LIBRARY=openssl
pip install pyresttest

export CF_AUTH_TOKEN=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/auth/test.yml | jq -r .access_token)

mkdir keyvalout
echo "CF_AUTH_TOKEN=${CF_AUTH_TOKEN}" >> keyvalout/keyval.properties
