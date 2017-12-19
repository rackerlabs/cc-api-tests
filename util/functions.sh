function write_env_vars_to_file () (
    set -eu
    props="cc-api-tests-put-bucket/app-usage-events.txt"
    echo "Setting key values for next job"
    while IFS='=' read -r name value ; do
	if [[ $name == 'CF_'* ]]; then
	    echo "Adding: ${name}"
	    echo "${name}=${value}" >> "$props"
	fi
    done < <(env)
    )
