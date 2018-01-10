function write_env_vars_to_file () (
    props="${OUTPUT}/${PIPELINE}.txt"
    echo "Setting key values for next job"
    while IFS='=' read -r name value ; do
	if [[ $name == 'CF_'* ]]; then
	    echo "Adding: ${name}"
	    echo "${name}=${value}" >> "$props"
	fi
    done < <(env)
)

function run_test () {
    if [ -z ${2} ]; then
	pyresttest --print-bodies=true https://${CF_API_URL} cc-api-tests/tasks/${1}/test.yml
    else
	${2}=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/${1}/test.yml | sed '$d' | jq -r ${3})
	export ${2}
    fi
    }

function post_to_datadog () {
    if [ -z "${DATADOG_API_KEY}" ]; then
	exit
    else
	currenttime=$(date +%s)

	curl  -X POST -H "Content-type: application/json" \
	      -d "{ \"series\" :
         [{\"metric\":\"cc_api_tests.${FOUNDATION}.${PIPELINE}.${TASK}\",
          \"points\":[[$currenttime, ${1}]],
          \"type\":\"gauge\",
          \"host\":\"${FOUNDATION}\",
          \"tags\":[\"application:cc-api-tests\"]}
         ]
    }" \
	      "https://app.datadoghq.com/api/v1/series?api_key=${DATADOG_API_KEY}"
    fi
}
