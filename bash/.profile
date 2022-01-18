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

. "${PREFIX}"/bin/console

if [[ $(command -v dextop) ]]
then
	[[ $(cat "${PREFIX}"/bin/dextop) = xfce ]] && session_name="XFCE" || session_name="CONSOLE"

	[ -f /etc/os-release ] && . /etc/os-release && name="${NAME}" || name=Ubuntu

	# settings

	if [ ! -f "${PREFIX}"/bin/container-settings-checkpoint ]
	then
		console.fwd "Setting up..."
		echo

		dbus-launch "${PREFIX}"/bin/container-settings

		console.file "${PREFIX}"/bin/container-settings-checkpoint
	fi

	# welcome

	if [[ $(ps -A | grep -i proot) ]]
	then
		console.fwd "Welcome to Dextop" "[ ${name} ]"
		echo

		if [ -f "${HOME}"/.vnc/selection ]
		then
			console.inf "You have already logged in - vnc selection has been saved."
			console.inf "Automatic session launch on shell login is enabled."
			echo
		else
			console.wrn "This is your first login:"
			console.wrn "Run 'container-session -o' to launch session [ ${session_name} ]."
			echo
		fi
	else
		console.fwd "Welcome to Dextop" "[ Termux ]"
		echo

		console.inf "Launch session: 'container-session -u <username>'"
	fi

	echo

	# automatic vnc session start

	if [[ $(ps -A | grep -i vnc) ]]
	then
		:
	else
		if [[ $(ps -A | grep -i proot) ]]
		then
			if [ -f "${HOME}"/.vnc/selection ]
			then
				echo $(cat "${HOME}"/.vnc/selection) | container-session -o
			else
				container-session -o
			fi
		fi
	fi
fi


