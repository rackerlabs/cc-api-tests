#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/delete_a_particular_source_app/test.yml

post_to_datadog 1
