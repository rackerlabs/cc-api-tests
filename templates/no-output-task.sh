#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

run_test TEST_NAME_WITH_UNDERSCORES OUTPUT_NAME RESPONSE_PATH

write_env_vars_to_file
