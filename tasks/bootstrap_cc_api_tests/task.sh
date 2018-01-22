#!/bin/bash
set -eu

uaac target "${CF_UAA_URI}"
uaac token client get admin -s "${CF_UAA_ADMIN_CLIENT_SECRET}"

set +e
uaac user get cc-api-tests
set -e

if [ $? -eq 0 ]
then
    echo "User already exists"
else
    uaac user add cc-api-tests -p "${CC_API_TEST_USER_PASSWORD}" --emails "${CC_API_TEST_USER_EMAIL}"
fi

uaac member add scim.read cc-api-tests
uaac member add uaa.admin cc-api-tests
uaac member add cloud_controller.admin cc-api-tests
uaac member add scim.write cc-api-tests
uaac member add routing.router_groups.read cc-api-tests
