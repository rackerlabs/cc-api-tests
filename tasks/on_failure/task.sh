#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh

if [ -z "${DATADOG_API_KEY}" ]; then
	exit
else
    post_to_datadog 0
    curl  -X POST -H "Content-type: application/json" \
	  -d '{
      "title": "API Test Failure for '${FOUNDATION}.${PIPELINE}.${TASK}'",
      "text": "Reported.",
      "priority": "normal",
      "tags": ["application:cc-api-tests"],
      "alert_type": "error"
  }' \
	  "https://app.datadoghq.com/api/v1/events?api_key=${DATADOG_API_KEY}"
fi
