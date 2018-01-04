#!/bin/bash
set -ex

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

run_test create_a_shared_domain CF_SHARED_DOMAIN_GUID .metadata.guid
write_env_vars_to_file
