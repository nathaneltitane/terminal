#!/bin/bash

# check for interactive session

[ -z "${PS1}" ] && return

# set shell options

shopt -s checkwinsize
shopt -s histappend
shopt -s histverify

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# bash completion

if [ ! $(shopt -oq posix) ]
then
	if [ -f /usr/share/bash-completion/bash_completion ]
	then
		. /usr/share/bash-completion/bash_completion

	elif [ -f /etc/bash_completion ]
	then
		. /etc/bash_completion
	fi
fi

# command not found

if [ -x /usr/lib/command-not-found ] || [ -x /usr/share/command-not-found/command-not-found ]
then
	command_not_found_handle () {
		if [ -x /usr/lib/command-not-found ]
		then
			/usr/lib/command-not-found -- "${1}"

			return $?

		elif [ -x /usr/share/command-not-found/command-not-found ]
		then
			/usr/share/command-not-found/command-not-found -- "${1}"

			return $?
		else
			printf "%s: command not found\n" "${1}" >&2

			return 127
		fi
	}
fi

# prompt string

# setup ansi colors escape using 'tput'

black="\001$(tput setaf 0)\002"
red="\001$(tput setaf 1)\002"
green="\001$(tput setaf 2)\002"
yellow="\001$(tput setaf 3)\002"
blue="\001$(tput setaf 4)\002"
magenta="\001$(tput setaf 5)\002"
cyan="\001$(tput setaf 6)\002"
white="\001$(tput setaf 7)\002"

reset="\001$(tput sgr 0)\002"

[ -z "${USER}" ] && USER="termux"

unset PS1

PS1+="${reset}[ "

if [[ $(id -u -n) = "root" ]]
then
	PS1+="${red}${USER}"

elif [[ $(id -u -n) = "termux" ]] && [[ $(ps -A | grep -i proot) ]]
then
	PS1+="${magenta}${USER}"
else
	PS1+="${green}${USER}"
fi

PS1+="${reset} ]"

if [[ $(id -u -n) = "root" ]]
then
	PS1+="${white} >_ # ${reset}"
else
	PS1+="${white} >_ $ ${reset}"
fi

# bash aliases

if [ -f "${HOME}"/.bash_aliases ]
then
	. "${HOME}"/.bash_aliases
fi

if [ -d "${HOME}"/.bash-aliases ]
then
	for alias in "${HOME}"/.bash-aliases/*
	do
		[ -x "${alias}" ] && . "${alias}"
	done
fi

# bash functions

if [ -f "${HOME}"/.bash_functions ]
then
	. "${HOME}"/.bash_functions
fi

if [ -d "${HOME}"/.bash-functions ]
then
	for function in "${HOME}"/.bash-functions/*
	do
		[ -x "${function}" ] && . "${function}"
	done
fi
