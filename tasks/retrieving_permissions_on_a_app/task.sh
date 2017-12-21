#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

run_test retrieving_permissions_on_a_app  

write_env_vars_to_file
