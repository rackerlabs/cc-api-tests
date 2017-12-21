#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

run_test list_all_service_bindings_for_the_app  

write_env_vars_to_file
