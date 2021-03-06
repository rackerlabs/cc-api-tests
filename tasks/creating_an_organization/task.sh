#!/bin/bash
set -eu

source cc-api-tests/util/functions.sh
source cc-api-tests/util/read_env_vars_from_file.sh


CF_ORG_NAME=${PIPELINE}-ORG

curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx
mv cf /usr/local/bin

DECODEDPW=$(python -c "import sys, urllib as ul; print ul.unquote_plus('${PASSWORD}')")

echo | cf login -u ${USERNAME} -p ${DECODEDPW} -a ${CF_API_URL} -o system --skip-ssl-validation

if CF_ORGANIZATION_GUID=$(cf org ${CF_ORG_NAME} --guid); then
    curl -k -H "Authorization: bearer $AUTH_TOKEN" -X DELETE "https://$CF_API_URL/v2/organizations/$CF_ORGANIZATION_GUID?recursive=true"
fi

CF_ORGANIZATION_GUID=$(pyresttest https://$CF_API_URL cc-api-tests/tasks/creating_an_organization/test.yml --print-bodies=true | sed '$d' | jq -r .metadata.guid)
export CF_ORGANIZATION_GUID

write_env_vars_to_file

post_to_datadog 1
