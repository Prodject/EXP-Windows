#!/bin/bash

if [ "$1" == "-i" ]; then
  sudo rm -r '/opt/EXP-Windows' 2> /dev/null
  sudo rm -rf '/bin/exploitw' 2> /dev/null
  sudo cp -r '../EXP-Windows/' '/opt/EXP-Windows/'
  
cat >"/bin/exploitw" <<-EOF
  cd /opt/EXP-Windows
	case \$1 in
	  -r | -remove)
      sudo rm -r '/opt/EXP-Windows'
      sudo rm -rf '/bin/exploitw'
      echo "EXP-Windows Was Uninstalled"
	  ;;
	  -s | -start)
      sudo bash /opt/EXP-Windows/main.sh -s
      exit
	  ;;
	  -d | -disclaimer)
      sudo bash /opt/EXP-Windows/main.sh -d
      exit
	  ;;
	  -v | -version)
      sudo bash /opt/EXP-Windows/main.sh -v
      exit
	  ;;
	  -h | -help | "")
      sudo bash /opt/EXP-Windows/main.sh -h
      exit
	  ;;
	esac
EOF
  
  sudo chmod +x '/opt/EXP-Windows'
  sudo chmod +x '/bin/exploitw'
  echo "EXP-Windows Was Installed"
fi

if [ "$1" == "-r" ]; then
  sudo rm -r '/opt/EXP-Windows' 2> /dev/null
  sudo rm -rf '/bin/exploitw' 2> /dev/null
  echo "EXP-Windows Was Uninstalled"
fi
