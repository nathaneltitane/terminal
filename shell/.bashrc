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
	if [ -f "${PREFIX}"/share/bash-completion/bash_completion ]
	then
		. "${PREFIX}"/share/bash-completion/bash_completion

	elif [ -f /usr/share/bash-completion/bash_completion ]
	then
		. /usr/share/bash-completion/bash_completion

	elif [ -f /etc/bash_completion ]
	then
		. /etc/bash_completion
	fi
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

if [ -d "${HOME}"/.bash-aliases ]
then
	for alias in "${HOME}"/.bash-aliases/*
	do
		[ -x "${alias}" ] && . "${alias}"
	done

elif [ -f "${HOME}"/.bash_aliases ]
then
	. "${HOME}"/.bash_aliases
fi

# bash functions

if [ -d "${HOME}"/.bash-functions ]
then
	for function in "${HOME}"/.bash-functions/*
	do
		[ -x "${function}" ] && . "${function}"
	done

elif [ -f "${HOME}"/.bash_functions ]
then
	. "${HOME}"/.bash_functions
fi