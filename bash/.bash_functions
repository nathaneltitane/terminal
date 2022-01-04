#!/bin/bash

if [ -d "${HOME}"/.bash-functions ]
then
	for function in "${HOME}"/.bash-functions/*
	do
		[ -x "${function}" ] && . "${function}"
	done
else
	if [ -f "${HOME}"/.bash-functions ]
	then
		. "${HOME}"/.bash-functions
	fi
fi
