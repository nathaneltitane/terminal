# automatic vnc session stop

if [[ $(ps -A | grep -i -E *vnc*) ]]
then
	container-session -x
fi