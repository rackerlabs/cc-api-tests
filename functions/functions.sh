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

function read_env_vars_from_file () (
    set -eu
    props="cc-api-tests-bucket/app-usage-events.txt"
    if [ -f "$props" ]
    then
	echo "Reading passed key values"
	while IFS= read -r var
	do
	    if [ ! -z "$var" ]
	    then
		echo "export $var"
	    fi
	done < "$props"
    fi
)
