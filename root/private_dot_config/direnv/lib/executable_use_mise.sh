#!/usr/bin/env bash

# This script ensures that the mise path is correctly set in direnv.
# It also prints out any tools that are currently missing. It is
# important that "use mise" is always the first command
# in our .envrc file:
#
# $ cat .envrc
# use mise
# layout uv-package

use_mise() {
	if ! has mise; then
		log_error "bin \`mise\` not found"
		return
	fi

	direnv_load mise direnv exec

	IFS=$'\n'
	for l in $(mise current 2>&1 | grep "not installed"); do
		log_error "$l"
	done
	unset IFS
}
