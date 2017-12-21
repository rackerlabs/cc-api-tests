#!/bin/bash
set -e

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

run_test creating_a_route CF_ROUTE_GUID .metadata.guid

write_env_vars_to_file
