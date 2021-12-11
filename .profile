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
	
	console.inf "Launch session or application: 'proot-session -u <username> | -a <application>'"
fi

echo