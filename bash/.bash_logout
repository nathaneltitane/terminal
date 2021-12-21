# automatic vnc session stop

if [[ $(ps -A | grep -i -E *vnc*) ]]
then
	container-vnc -x
fi