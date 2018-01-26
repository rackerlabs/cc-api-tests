#!/bin/bash
set -exu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh

CF_SHARED_DOMAIN_NAME=${PIPELINE}.com

curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx
mv cf /usr/local/bin

DECODEDPW=$(python -c "import sys, urllib as ul; print ul.unquote_plus('${PASSWORD}')")

echo | cf login -u ${USERNAME} -p ${DECODEDPW} -a ${CF_API_URL} -o system --skip-ssl-validation
yes | cf delete-shared-domain ${CF_SHARED_DOMAIN_NAME}

CF_SHARED_DOMAIN_GUID=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/create_a_shared_domain/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_SHARED_DOMAIN_GUID
write_env_vars_to_file

post_to_datadog 1
