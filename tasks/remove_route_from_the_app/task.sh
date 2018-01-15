#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

pyresttest https://$CF_API_URL cc-api-tests/tasks/remove_route_from_the_app/test.yml --print-bodies=true
post_to_datadog 1
