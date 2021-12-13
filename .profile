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

# proot startup #

if [ ! -f "${BINARIES_DIRECTORY}"/container-startup-complete ]
then
	# continue proot setup
	
	"${BINARIES_DIRECTORY}"/container-setup

	# confirm uninterrupted setup
	
	echo "yes" > "${BINARIES_DIRECTORY}"/container-startup-complete
	
	# clear #
	
	console.clear
	
	# exit proot after successful setup
	
	console.fwd "Logging out..."
	echo
	
	exit
fi

# user startup #

if [ ! -f "${BINARIES_DIRECTORY}"/user-startup-complete ]
then
	# continue user setup
	
	"${BINARIES_DIRECTORY}"/user-setup

	# confirm uninterrupted setup
	
	echo "yes" > "${BINARIES_DIRECTORY}"/user-startup-complete
	
	# clear #
	
	console.clear
	
	# exit proot after successful setup
	
	console.fwd "Logging out..."
	echo
	
	exit
fi

# dextop welcome

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
		console.wrn "Run 'vnc-session -o' to launch session [ ${SESSION_NAME} ]."
		echo
	fi
else
	console.fwd "Welcome to Dextop" "[ Termux ]"
	echo
	
	console.inf "Launch session or application: 'container-session -u <username> | -a <application>'"
fi

echo

# automatic vnc session start

if [ -f "${HOME}"/.vnc/selection ]
then
	echo $(cat "${HOME}"/.vnc/selection) | vnc-session -o
else
	vnc-session -o
fi

# dextop container configuration

container-keyboard
container-locales
container-timezones