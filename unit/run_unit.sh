#!/bin/bash
set -e

pyresttest https://$CF_API_URL unit/"$1".yaml --print-bodies=true | sed '$d' | jq .
