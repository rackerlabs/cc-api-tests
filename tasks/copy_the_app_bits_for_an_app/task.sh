#!/bin/bash
set -eux

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

pyresttest https://$CF_API_URL cc-api-tests/tasks/copy_the_app_bits_for_an_app/test.yml --print-bodies=true

post_to_datadog 1
