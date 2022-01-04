#!/bin/bash

if [ -d "${HOME}"/.bash-aliases ]
then
	for alias in "${HOME}"/.bash-aliases/*
	do
		[ -x "${alias}" ] && . "${alias}"
	done
else
	if [ -f "${HOME}"/.bash-aliases ]
	then
		. "${HOME}"/.bash-aliases
	fi
fi
