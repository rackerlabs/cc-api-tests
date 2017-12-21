#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/creating_an_app/test.yml

write_env_vars_to_file
