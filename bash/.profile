# prefix

[ -z "${PREFIX}" ] && PREFIX=""

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

# environment

export DISPLAY=":1"
export DISPLAY_NUMBER="${DISPLAY/:/}"
export PORT="590${DISPLAY_NUMBER}"

# dextop welcome

if [[ $(command -v dextop) ]]
then
	[[ $(cat "${PREFIX}"/bin/dextop) = xfce ]] && session_name="XFCE" || session_name="CONSOLE"

	[ -f /etc/os-release ] && . /etc/os-release && name="${NAMEˆ}" || name=Ubuntu

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
			console.wrn "Run 'container-vnc -o' to launch session [ ${session_name} ]."
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
				echo $(cat "${HOME}"/.vnc/selection) | container-vnc -o
			else
				container-vnc -o
			fi
		fi
	fi

	# container configuration

	if [[ $(ps -A | grep -i proot) ]]
	then
		if [ ! -f "${PREFIX}"/bin/container-configuration-complete ]
		then
			console.reconfigure tzdata
			console.reconfigure locales
			console.reconfigure keyboard-configuration

			console.file "${PREFIX}"/bin container-configuration-complete
		fi
	fi
fi
