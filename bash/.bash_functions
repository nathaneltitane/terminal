# address #

address () {
	echo

	curl -s -L ipinfo.io/ip

	echo
}
# audio #

audio () {
	[[ -z $(command -v ffmpeg) ]] && console.install ffmpeg

	directory="${PWD}"
	extension="${1}"

	if [ "${extension}" = "flac" ]
	then
		codec_option="-b:a 320k"
	else
		codec_option="-acodec copy"
	fi

	for file in $(find "${directory}" -type f -iname "*.${extension}")
	do
		ffmpeg					\
			-i "${file}"		\
			"${codec_option}"	\
			-map_metadata 0		\
			-id3v2_version 3	"${file%.*}.mp3"
	done
}

# colors #

colors () {
	for foreground_color in {0..7}
	do
		set_foreground=$(tput setaf $foreground_color)

		for background_color in {0..7}
		do
			set_background=$(tput setab $background_color)

			echo -n $set_background$set_foreground

			printf ' F:%s B:%s ' $foreground_color $background_color
		done

		echo $(tput sgr0)

	done

	echo
}

hex () {
	IFS='(,)'

	read _ r g b <<< "${1}"

	printf '%02x%02x%02x\n' ${r} ${g} ${b}
}

rgb () {
	read hex <<< "${1}"

	[[ ${hex:0:1} = "#" ]] && hex=${hex:1:6}

	r=$((16#${hex:0:2}))
	g=$((16#${hex:2:2}))
	b=$((16#${hex:4:2}))

	printf '%03d %03d %03d\n' ${r} ${g} ${b}
}

# directory #

directory () {
	if [[ $(command -v mkdir) ]]
	then
		mkdir -p "${1}"

		cd "${1}"
	fi
}

# extract #

extract () {
	if [ -f "${1}" ]
	then
		case "${1}"
		in
			*.tar.bz2)
				tar xjf "${1}"
			;;

			*.tar.gz)
				tar xzf "${1}"
			;;

			*.bz2)
				bunzip2 "${1}"
			;;

			*.rar)
				unrar e "${1}"
			;;

			*.gz)
				gunzip "${1}"
			;;

			*.tar)
				tar xf "${1}"
			;;

			*.tbz2)
				tar xjf "${1}"
			;;

			*.tgz)
				tar xzf "${1}"
			;;

			*.zip)
				unzip "${1}"
			;;

			*.Z)
				uncompress "${1}"
			;;

			*.7z)
				7z x "${1}"
			;;

			*)
				echo
				echo -e "'${1}' - extraction failed:"
				echo -e "Unknown or unsupported archive type."
				echo

				exit 1
			;;

		esac
	else
		echo
		echo -e "'${1}' is not a valid archive type."
		echo
	fi
}

# record #

record () {
	[[ -z "$(command -v recordmydesktop)" ]] && console.install recordmydesktop

	[ -f "${HOME}"/Videos ] && path="${HOME}"/Videos || path="${HOME}"

	stamp="$(date +"%m-%d-%Y-%H-%M-%S")"
	window_id="$(xwininfo | grep "Window id" | cut -d ' ' -f 4)"

	wmctrl -i -R "${window_id}"

	console.wait 1

	recordmydesktop								\
		--no-cursor								\
		--no-wm-check							\
		--no-sound								\
		--overwrite								\
		--windowid "${window_id}"				\
		--output="${path}"/clip-"${stamp}".ogv
}

# size #

size () {
	echo "W: $(tput cols) x H: $(tput lines)"
}

# sprunge #

sprunge () {
	url="http://sprunge.us"

	if (($#))
	then
		curl -F 'sprunge=<-' "${url}" < "${1}"
	else
		curl -F 'sprunge=<-' "${url}"
	fi
}

# weather #

weather () {
	echo

	curl -s wttr.in | head -n -2

	echo
}

# youtube #

youtube () {
	[[ -z $(command -v youtube-dl) ]] && console.download https://yt-dl.org/downloads/latest "${PREFIX}"/bin youtube-dl

	path="${2}"

	[ -z "${path}" ] && path="${PWD}"

	cd "${path}" || exit 1

	youtube-dl												\
		--ignore-errors										\
		--yes-playlist										\
		--extract-audio										\
		--format			bestaudio						\
		--audio-format		mp3								\
		--audio-quality		160K							\
		--output			"%(title)s.%(ext)s"				\
															"${1}"
}
