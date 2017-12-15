include .envrc
export
test:
	find . -name '*.yaml' -exec pyresttest https://$$CF_API_URL {} \;
