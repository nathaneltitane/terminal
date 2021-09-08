# dependant aliases #

[ -d "/" ] && alias 'rd'='cd /'
[ -d "${HOME}" ] && alias 'hd'='cd "${HOME}"'
[ -d "${HOME}"/Git ] && alias 'gd'='cd "${HOME}"/Git'
[ -d "${HOME}"/.vnc ] && alias 'vd'='cd "${HOME}"/.vnc'
[ -d "/media" ] && alias 'md'='cd /media'
[ -d "/media/Internal" ] && alias 'id'='cd /media/Internal'
[ -d "/media/External" ] && alias 'ed'='cd /media/External'

[ -x $(which sudo) ] && alias sudo='sudo -p "$(tput setaf 3)[ D ] >_ ? $(tput sgr 0)"'

[ -x $(which rsync) ] && alias 'cp'='rsync -a -r --progress -h'

[ -x $(which git) ] && alias 'gc'='git clone'
[ -x $(which git) ] && alias 'gi'='git init'
[ -x $(which git) ] && alias 'gp'='git pull'
[ -x $(which git) ] && alias 'ga'='git add *'
[ -x $(which git) ] && alias 'gm'="git commit -a -m ${1}"
[ -x $(which git) ] && alias 'gs'='git push'
[ -x $(which git) ] && alias 'gu'='ga && gm "Code & Features Update" && gs'

[ -x $(which nano) ] && alias 'nano'='nano -c -g -i -l -m -D -F -J80 -T4'

# aliases #

alias 'autoclean'='sudo apt-get autoclean'
alias 'autoremove'='sudo apt-get autoremove'
alias 'check'='sudo apt-get check'
alias 'clean'='sudo apt-get clean'
alias 'distribution-upgrade'='sudo apt-get dist-upgrade'
alias 'download'='sudo apt-get download'
alias 'install'='sudo apt-get install --no-install-recommends --no-upgrade'
alias 'purge'='sudo apt-get purge'
alias 'reinstall'='sudo apt-get reinstall'
alias 'repair'='sudo apt-get -f install'
alias 'remove'='sudo apt-get remove'
alias 'source'='sudo apt-get source'
alias 'update'='sudo apt-get update'
alias 'upgrade'='sudo apt-get upgrade'

alias 'depend'='sudo apt-cache depends'
alias 'reverse'='sudo apt-cache rdepends'
alias 'search'='sudo apt-cache search'
alias 'status'='sudo apt-cache stats'

alias 'start'='sudo systemctl start'
alias 'stop'='sudo systemctl stop'
alias 'enable'='sudo systemctl enable'
alias 'disable'='sudo systemctl disable'
alias 'status'='sudo systemctl status'

alias 'kill'="sudo pkill -9"

alias '..'='cd ..'
alias '...'='cd ../../../'
alias '....'='cd ../../../../'
alias '.....'='cd ../../../../'

alias 'list'='ls -a -c -h -l --color=auto --group-directories-first'

alias 'where'='echo ${PWD}'

alias 'directory'='mkdir -p'

alias 'count'='find . -type f | wc -l'

alias 'duplicate'="dd if=${1} of=${2} bs=${3} status=progress"

alias 'usage'='du -a -d 1 -h -S --time 2> /dev/null | sort -n -r'

alias 'ping'='ping -c 5'