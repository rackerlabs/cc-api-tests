#!/bin/bash
set -e

echo "auth"
export CF_AUTH_TOKEN=$(unit/run_unit.sh auth | jq -r .access_token)

echo "list_all_app_usage_events"
export CF_GUID=$(unit/run_unit.sh list_all_app_usage_events | jq -r .resources[0].metadata.guid)

echo "retrieve_a_particular_app_usage_event"
unit/run_unit.sh retrieve_a_particular_app_usage_event >/dev/null
