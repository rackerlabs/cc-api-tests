#!/bin/bash
set -eu

add_uaac_member ()
{
    set +e
    uaac user get cc-api-tests |grep "${1}"
    if [ $? -ne 0 ]
    then
	uaac member "${1}" cc-api-tests
    fi
    set -e
}

uaac target "${CF_UAA_URI}"
uaac token client get admin -s "${CF_UAA_ADMIN_CLIENT_SECRET}"

set +e
uaac user get cc-api-tests

if [ $? -eq 0 ]
then
    set -e
    echo "User already exists"
else
    set -e
    uaac user add cc-api-tests -p "${CC_API_TEST_USER_PASSWORD}" --emails "${CC_API_TEST_USER_EMAIL}"
fi

add_uaac_member scim.read
add_uaac_member uaa.admin
add_uaac_member cloud_controller.admin
add_uaac_member scim.write
add_uaac_member routing.router_groups.read
