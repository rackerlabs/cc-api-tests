#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

run_test creating_an_organization CF_ORGANIZATION_GUID .metadata.guid

write_env_vars_to_file
