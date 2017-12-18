#!/bin/sh
set -eu

apk update
apk add py-curl py-yaml curl-dev build-base
export PYCURL_SSL_LIBRARY=openssl
pip install pyresttest

pyresttest https://$CF_API_URL cc-api-tests/tests/auth.yml
