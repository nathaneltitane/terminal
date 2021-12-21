#!/bin/bash

if [ -d "${HOME}"/.bash-functions ]
then
	for function in "${HOME}"/.bash-functions/*
	do
		[ -x "${function}" ] && . "${function}"
	done
fi