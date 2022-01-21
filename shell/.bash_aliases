# aliases #

# dextop #

[[ $(command -v container-session) ]]                                                  && alias 'dt'='container-session -o'
[[ $(command -v container-session) && $(grep -i termux "${PREFIX}"/cnt/etc/passwd) ]]  && alias 'dc'='container-session -u termux'
[[ $(command -v container-session) && $(grep -i root   "${PREFIX}"/cnt/etc/passwd) ]]  && alias 'dr'='container-session -u root'

# directories #

[[ $(ls -d "${PREFIX}" 2> /dev/null) ]]                                                && alias 'pd'='cd "${PREFIX}"'
[[ $(ls -d "${HOME}" 2> /dev/null) ]]                                                  && alias 'hd'='cd "${HOME}"'
[[ $(ls -d "${PREFIX}"/media 2> /dev/null) ]]                                          && alias 'md'='cd "${PREFIX}"/media'
[[ $(ls -d "${PREFIX}"/storage 2> /dev/null) ]]                                        && alias 'sd'='cd "${PREFIX}"/storage'
[[ $(ls -d "${PREFIX}"/media/[eE]xternal 2> /dev/null) ]]                              && alias 'ex'='cd "${PREFIX}"/media/[eE]xternal'
[[ $(ls -d "${PREFIX}"/media/[iI]nternal 2> /dev/null) ]]                              && alias 'in'='cd "${PREFIX}"/media/[iI]nternal'

# git #

[[ $(command -v git) ]]                                                                && alias 'gc'="git clone --depth 1"
[[ $(command -v git) ]]                                                                && alias 'gi'='git init'
[[ $(command -v git) ]]                                                                && alias 'gp'='git pull'
[[ $(command -v git) ]]                                                                && alias 'ga'='git add *'
[[ $(command -v git) ]]                                                                && alias 'gm'="git commit -a -m ${1}"
[[ $(command -v git) ]]                                                                && alias 'gs'='git push'
[[ $(command -v git) ]]                                                                && alias 'gu'='ga && gm "Code & Features Update" && gs'

[[ $(ls -d "${HOME}"/[gG]it 2> /dev/null) ]]                                           && alias 'gd'='cd "${HOME}"/[gG]it)'
[[ $(ls -d "${PREFIX}"/media/[eE]xternal/[gG]it 2> /dev/null)  ]]                      && alias 'gd'='cd "${PREFIX}"/media/[eE]xternal/[gG]it'
[[ $(ls -d "${PREFIX}"/media/[iI]nternal/[gG]it 2> /dev/null) ]]                       && alias 'gd'='cd "${PREFIX}"/media/[iI]nternal/[gG]it'
[[ $(ls -d "${PREFIX}"/storage/[eE]xternal/[gG]it 2> /dev/null)  ]]                    && alias 'gd'='cd "${PREFIX}"/storage/[eE]xternal/[gG]it'
[[ $(ls -d "${PREFIX}"/storage/[iI]nternal/[gG]it 2> /dev/null) ]]                     && alias 'gd'='cd "${PREFIX}"/storage/[iI]nternal/[gG]it'

# commands #

[[ $(command -v cd) ]]                                                                 && alias '..'='cd ..'
[[ $(command -v df) ]]                                                                 && alias 'df'='df -H'
[[ $(command -v du) ]]                                                                 && alias 'du'='du -a -c -h'

[[ $(command -v rsync) ]]                                                              && alias 'copy'='rsync -a -r -q --progress -h'
[[ $(command -v find) && $(command -v wc) ]]                                           && alias 'countd'="echo $(find . -type d | wc -l) directories [ ${PWD} ]"
[[ $(command -v find) && $(command -v wc) ]]                                           && alias 'countf'='echo $(find . -type f | wc -l) files [ ${PWD} ]'
[[ $(command -v nano) ]]                                                               && alias 'edit'='nano -c -g -i -l -m -D -F -J80 -T4'
[[ $(command -v ls) && $(command -v grep) ]]                                           && alias 'efilter'='env | grep -i'
[[ $(command -v ls) && $(command -v grep) ]]                                           && alias 'ffilter'='ls -a | grep -i'
[[ $(command -v ps) && $(command -v grep) ]]                                           && alias 'pfilter'='ps -A | grep -i'
[[ $(command -v grep) ]]                                                               && alias 'grep'='grep --color=auto'
[[ $(command -v egrep) ]]                                                              && alias 'egrep'='egrep --color=auto'
[[ $(command -v fgrep) ]]                                                              && alias 'fgrep'='fgrep --color=auto'
[[ $(command -v curl) ]]                                                               && alias 'header'='curl -I'
[[ $(command -v ls) ]]                                                                 && alias 'list'='ls -A -c -h -l --color=auto --group-directories-first'
[[ $(command -v mount) && $(command -v column) ]]                                      && alias 'mounts'='mount | column -t'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'autoclean'='sudo apt-get autoclean'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'autoremove'='sudo apt-get autoremove'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'check'='sudo apt-get check'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'clean'='sudo apt-get clean'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'distribution-upgrade'='sudo apt-get dist-upgrade'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'download'='sudo apt-get download'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'install'='sudo apt-get install --no-install-recommends --no-upgrade'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'purge'='sudo apt-get purge'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'reinstall'='sudo apt-get reinstall'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'repair'='sudo apt-get -f install'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'remove'='sudo apt-get remove'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'source'='sudo apt-get source'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'update'='sudo apt-get update'
[[ $(command -v sudo) && $(command -v apt-get) ]]                                      && alias 'upgrade'='sudo apt-get upgrade'
[[ $(command -v apt-get) ]]                                                            && alias 'autoclean'='apt-get autoclean'
[[ $(command -v apt-get) ]]                                                            && alias 'autoremove'='apt-get autoremove'
[[ $(command -v apt-get) ]]                                                            && alias 'check'='apt-get check'
[[ $(command -v apt-get) ]]                                                            && alias 'clean'='apt-get clean'
[[ $(command -v apt-get) ]]                                                            && alias 'distribution-upgrade'='apt-get dist-upgrade'
[[ $(command -v apt-get) ]]                                                            && alias 'download'='apt-get download'
[[ $(command -v apt-get) ]]                                                            && alias 'install'='apt-get install --no-install-recommends --no-upgrade'
[[ $(command -v apt-get) ]]                                                            && alias 'purge'='apt-get purge'
[[ $(command -v apt-get) ]]                                                            && alias 'reinstall'='apt-get reinstall'
[[ $(command -v apt-get) ]]                                                            && alias 'repair'='apt-get -f install'
[[ $(command -v apt-get) ]]                                                            && alias 'remove'='apt-get remove'
[[ $(command -v apt-get) ]]                                                            && alias 'source'='apt-get source'
[[ $(command -v apt-get) ]]                                                            && alias 'update'='apt-get update'
[[ $(command -v apt-get) ]]                                                            && alias 'upgrade'='apt-get upgrade'
[[ $(command -v sudo) && $(command -v apt-cache) ]]                                    && alias 'depend'='sudo apt-cache depends'
[[ $(command -v sudo) && $(command -v apt-cache) ]]                                    && alias 'reverse'='sudo apt-cache rdepends'
[[ $(command -v sudo) && $(command -v apt-cache) ]]                                    && alias 'search'='sudo apt-cache search'
[[ $(command -v sudo) && $(command -v apt-cache) ]]                                    && alias 'status'='sudo apt-cache stats'
[[ $(command -v apt-cache) ]]                                                          && alias 'depend'='apt-cache depends'
[[ $(command -v apt-cache) ]]                                                          && alias 'reverse'='apt-cache rdepends'
[[ $(command -v apt-cache) ]]                                                          && alias 'search'='apt-cache search'
[[ $(command -v apt-cache) ]]                                                          && alias 'status'='apt-cache stats'
[[ $(command -v chgrp) ]]                                                              && alias 'chgrp'='chgrp --preserve-root'
[[ $(command -v chmod) ]]                                                              && alias 'chmod'='chmod --preserve-root'
[[ $(command -v chown) ]]                                                              && alias 'chown'='chown --preserve-root'
[[ $(command -v netstat) ]]                                                            && alias 'ports'='netstat -t -u -l -a -n -p'
[[ $(command -v ps) ]]                                                                 && alias 'processes'='ps -A'
[[ $(command -v rm) ]]                                                                 && alias 'remove'='rm -rf'
[[ $(command -v ping) ]]                                                               && alias 'sonar'='ping -c 5'
[[ $(command -v sudo) ]]                                                               && alias 'sudo'='sudo -p "[ $(tput setaf 3)${USER}$(tput sgr 0) ] >_ ? "'
[[ $(command -v sudo) && $(command -v systemctl) ]]                                    && alias 'start'='sudo systemctl start'
[[ $(command -v sudo) && $(command -v systemctl) ]]                                    && alias 'stop'='sudo systemctl stop'
[[ $(command -v sudo) && $(command -v systemctl) ]]                                    && alias 'enable'='sudo systemctl enable'
[[ $(command -v sudo) && $(command -v systemctl) ]]                                    && alias 'disable'='sudo systemctl disable'
[[ $(command -v sudo) && $(command -v systemctl) ]]                                    && alias 'status'='sudo systemctl status'
[[ $(command -v sudo) && $(command -v pkill) ]]                                        && alias 'terminate'="sudo pkill -9"
[[ $(command -v pkill) ]]                                                              && alias 'terminate'="pkill -9"
[[ $(command -v du) && $(command -v sort) ]]                                           && alias 'usage'="du -a -d 1 -h -S --time 2> /dev/null | sed '/total/ [ Total ]/g"
[[ $(command -v wget) ]]                                                               && alias 'wget'='wget -c'
[[ $(command -v echo) ]]                                                               && alias 'where'='echo ${PWD}'
