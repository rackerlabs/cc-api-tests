#!/bin/bash

echo "What CC API Section are you working on? (example: apps)"
read CC_API_SECTION

echo "What is the name of the test? (example: creating_an_organization)"
read TEST_NAME_WITH_UNDERSCORES

TEST_NAME=$(echo "$TEST_NAME_WITH_UNDERSCORES" | tr '_' '-')

echo "What is the request path? (example: /v2/organizations)"
read REQUEST_PATH

echo "What is the request method? (example: POST)"
read REQUEST_METHOD

echo "What is the expected response? (example: 201)"
read EXPECTED_RESPONSE

echo "(Return to skip) What name do you want for the output variable? (example: CF_SPACE_GUID)"
read OUTPUT_NAME
echo "(Return to skip) What is the response path to the output variable? (example .metadata.guid)"
read RESPONSE_PATH

cat templates/no-output-pipeline.yml |sed -e "s/TEST_NAME_WITH_UNDERSCORES/${TEST_NAME_WITH_UNDERSCORES}/g" -e "s/TEST_NAME/${TEST_NAME}/g" >> pipelines/"$CC_API_SECTION"/pipeline.yml

mkdir tasks/"$TEST_NAME_WITH_UNDERSCORES"

for x in no-output-task.sh no-output-test.yml no-output-task.yml; do
    cat templates/$x | sed -e "s/TEST_NAME_WITH_UNDERSCORES/${TEST_NAME_WITH_UNDERSCORES}/g" \
			   -e "s/TEST_NAME/${TEST_NAME}/g" \
			   -e "s/CC_API_SECTION/${CC_API_SECTION}/g" \
			   -e "s#REQUEST_PATH#${REQUEST_PATH}#g" \
			   -e "s/REQUEST_METHOD/${REQUEST_METHOD}/g" \
			   -e "s/OUTPUT_NAME/${OUTPUT_NAME}/g" \
			   -e "s/RESPONSE_PATH/${RESPONSE_PATH}/g" \
			   -e "s/EXPECTED_RESPONSE/${EXPECTED_RESPONSE}/g" > tasks/"$TEST_NAME_WITH_UNDERSCORES"/"$(echo $x | sed 's/no-output-//g')"
done

chmod +x tasks/"$TEST_NAME_WITH_UNDERSCORES"/task.sh
