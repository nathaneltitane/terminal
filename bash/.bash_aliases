#!/bin/bash

if [ -d "${HOME}"/.bash-aliases ]
then
	for alias in "${HOME}"/.bash-aliases/*
	do
		[ -x "${alias}" ] && . "${alias}"
	done
fi