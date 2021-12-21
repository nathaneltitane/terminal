# bashrc

if [ -n "${BASH_VERSION}" ]
then
	if [ -f "${HOME}"/.bashrc ]
	then
		. "${HOME}"/.bashrc
	fi
fi

# paths

if [ -d "${HOME}"/bin ]
then
	PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}"/.local/bin ]
then
	PATH="${HOME}/.local/bin:${PATH}"
fi

# dependencies #

. /data/data/com.termux/files/usr/bin/console
. /data/data/com.termux/files/usr/bin/dextop

# dextop welcome

if [[ $(command -v dextop) ]]
then
	if [[ $(ps -A | grep -i proot) ]]
	then
		console.fwd "Welcome to Dextop" "[ ${DISTRIBUTION_NAME} ]"
		echo

		if [ -f "${HOME}"/.vnc/selection ]
		then
			console.inf "You have already logged in - vnc selection has been saved."
			console.inf "Automatic session launch on shell login is enabled."
			echo
		else
			console.wrn "This is your first login:"
			console.wrn "Run 'container-vnc -o' to launch session [ ${SESSION_NAME} ]."
			echo
		fi
	else
		console.fwd "Welcome to Dextop" "[ Termux ]"
		echo

		console.inf "Launch session or application: 'container-session -u <username> | -a <application>'"
	fi

	echo

	# automatic vnc session start

	if [[ $(ps -A | grep -i proot) ]]
	then
		if [ -f "${HOME}"/.vnc/selection ]
		then
			echo $(cat "${HOME}"/.vnc/selection) | container-vnc -o
		else
			container-vnc -o
		fi
	fi

	# container configuration

	if [[ $(ps -A | grep -i proot) ]]
	then
		if [ ! -f "${BINARIES_DIRECTORY}"/container-configuration-complete ]
		then
			console.reconfigure tzdata
			console.reconfigure locales
			console.reconfigure keyboard-configuration

			console.file "${BINARIES_DIRECTORY}" container-configuration-complete
		fi
	fi
fi