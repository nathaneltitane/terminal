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
	if [[ $(cat "${PREFIX}"/bin/dextop) = xfce ]]
	then
		session_name="XFCE"
	else
		session_name="CONSOLE"
	fi

	[ -f /etc/os-release ] && . /etc/os-release && name="${NAME}"

	# audio

	if [[ $(command -v pulseaudio) ]]
	then
		pulseaudio --start &

		export PULSE_SERVER=tcp:127.0.0.1:4712
	fi

	# settings

	if [ ! -f "${HOME}"/.dextop/dextop-settings-checkpoint ]
	then
		console.fwd "Setting up..."
		echo

		dbus-launch "${PREFIX}"/bin/container-settings

		console.file "${HOME}"/.dextop dextop-settings-checkpoint

		console.clear
	fi

	# update

	if [[ $(ps -A | grep -i proot) ]]
	then
		:
	else
		if [[ $(cat "${HOME}"/.dextop/dextop-update) = "update" ]]
		then
			console.fwd "Updating..."
			echo

			utilities_list+=(
				termux-directories
				termux-packages
				termux-repositories
				termux-storage
				termux-update
				container-expansion
				container-image
				container-packages
				container-repositories
				container-session
				container-settings
				container-system
				container-user
			)

			console.download get.dxtp.app "${PREFIX}"/bin ${utilities_list[@]}

			console.clear
		fi
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

		console.inf "Launch session: 'container-session -u <username> | -a <application>'"
	fi

	echo

	# automatic session start

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