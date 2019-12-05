#!/bin/bash

CYAN="\033[0;96m"
CYAN_BOLD="\033[1;96m"
GREEN="\033[0;32m"
GREEN_BOLD="\033[1;32m"
YELLOW="\033[0;33m"
YELLOW_BOLD="\033[1;33m"
RED="\033[0;31m"
RED_BOLD="\033[1;31m"
NC="\033[0m"

BRANCH_COLOR=${YELLOW_BOLD}
SIGN_COLOR=${CYAN_BOLD}

set-prompt()
{
	local git_prompt=""

	local current_commit_hash=$(git rev-parse HEAD 2> /dev/null)
	if [[ ! -n $current_commit_hash ]]; then exit 1; fi

	local current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
	if [[ $current_branch == 'HEAD' ]]; then
		current_branch=${current_commit_hash:0:7}
	fi

	git_prompt+=${BRANCH_COLOR}"[$current_branch"${NC}

	local git_status="$(git status --porcelain 2> /dev/null)"

	if [[ ! $git_status == "" ]]; then

		if [[ $git_status =~ ($'\n'|^)A ]]; then
			git_prompt+=${SIGN_COLOR}" ☻"${NC}
		fi

		if [[ $git_status =~ ($'\n'|^).M|($'\n'|^).D ]]; then
			git_prompt+=${SIGN_COLOR}" ⚑"${NC}
		fi

		if [[ $git_status == *"??"*  ]]; then
			git_prompt+=${SIGN_COLOR}" ☢"${NC}
		fi

	fi

	git_prompt+=${BRANCH_COLOR}"]"${NC}


	echo -e $git_prompt
}

set-prompt
