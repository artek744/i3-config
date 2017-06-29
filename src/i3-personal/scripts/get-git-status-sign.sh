#!/bin/bash

function print_git_status_sign ()
{
	git_status_signs=""
	modified_sign="#"
	untracked_files_sign="U"

	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		return
	fi

	local git_status_output=`git status -s -uno`
	if [[ -n "${git_status_output}" ]]; then
		git_status_signs="$git_status_signs$modified_sign"
	fi

	local git_status_output=`git ls-files --others --exclude-standard`
	if [[ -n "${git_status_output}" ]]; then
		git_status_signs="$git_status_signs$untracked_files_sign"
	fi
	echo $git_status_signs
}

print_git_status_sign
