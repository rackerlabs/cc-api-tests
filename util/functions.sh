function write_env_vars_to_file () (
    set -eu
    props="cc-api-tests-put-bucket/${PIPELINE}.txt"
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
	export ${2}=$(pyresttest --print-bodies=true https://$CF_API_URL cc-api-tests/tasks/${1}/test.yml | sed '$d' | jq -r ${3})
    fi
}
