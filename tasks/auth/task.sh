#!/bin/bash
set -eu

pip install pyresttest
pyresttest https://$CF_API_URL cc-api-tests/tests/auth.yml
