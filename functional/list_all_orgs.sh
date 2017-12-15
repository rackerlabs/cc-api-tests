#!/bin/bash
set -e

echo "auth"
export CF_AUTH_TOKEN=$(unit/run_unit.sh auth | jq -r .access_token)

echo "list_all_orgs"
unit/run_unit.sh list_all_orgs >/dev/null
