#!/bin/bash

trap end_script SIGINT
trap end_script SIGTERM

source ".config"

source "assets/variables.sh"
source "assets/functions.sh"
source "assets/arguments.sh"

clear && echo -en "\\033]0;$ScriptName | $ScriptVersion\\a"

echo -e "\n $ScriptAuthor | Drinked 6 Coffees | Eaten 6 Pizzas | Slept 6 Hours $CLRD \n"
echo "  MMMMMMMMMMMMMMMMM: | :MMMMMMMMMMMMMMMMMMMMM: | :MMMMMMMMMMMMMMMMM  "
echo "  MM ███████╗ MMMMMM  | :MMMMMMMMMMMMMMMMMMM: |  MMMMM ██╗    ██╗ M  "
echo "  MM ██╔════╝ MMMMMMM  | :MMMM|:--.--:|MMMM: |  MMMMMM ██║    ██║ M  "
echo "  MM █████╗   MMMMMMMM  :. .-::|||||||::-. .:  MMMMMMM ██║ █╗ ██║ M  "
echo "  MM ██╔══╝   MMMMMMM  -:|||||||||||||||||||:-  MMMMMM ██║███╗██║ M  "
echo "  MM ███████╗ MMMMM .:|||||||||||||||||||||||||:. MMMM ╚███╔███╔╝ M  "
echo "  MM ╚══════╝ MMM .|||||||||||||||||||||||||||||||. MM  ╚══╝╚══╝  M  "
echo "  MMMMMMMMMMMMM  :|||||/   \|||||||||||||/   \|||||:  MMMMMMMMMMMMM  "
echo "  MMMMMMMMMMMM  :||||||\   /|||||||||||||\   /||||||:  MMMMMMMMMMMM  "
echo "  MMMMMMMMMMMM :|||||||||||||||||||||||||||||||||||||: MMMMMMMMMMMM  "
echo "  MMMMMMMMMMM  |||||||||||||||||||||||||||||||||||||||  MMMMMMMMMMM  "
echo "  MMMMMMMMMMM -|||||||||||||||||||||||||||||||||||||||- MMMMMMMMMMM  "

check_root
check_bash
check_caps
check_updt
check_dpkg

echo -en $CLYW "\n Press [ENTER] to continue ... "
read continue

echo -en "\n ${CAMRK} Generating All Necessary Files ... "

apacheserver

metasploit

end_script
