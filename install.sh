#!/bin/bash

if [ $1 = "-i" ]; then
  if [ -e "/opt/EXP-Windows" ]; then
    sudo rm -r '/opt/EXP-Windows/'
    sudo cp -r '../EXP-Windows/' '/opt/EXP-Windows/'
    sudo chmod +x '/opt/EXP-Windows/'

sudo rm -rf '/bin/exploitw' 2> /dev/null
cat >"/bin/exploitw" <<-EOF
  sudo bash /opt/EXP-Windows/main.sh

  if [ $1 = "-r" ]; then
    sudo rm -r '/opt/EXP-Windows/'
    sudo rm -rf '/bin/exploitw'
    echo "EXP-Windows Was Uninstalled"
  fi
EOF
    echo "EXP-Windows Was Re-Installed"
  else
    sudo cp -r '../EXP-Windows/' '/opt/EXP-Windows/'
    sudo chmod +x '/opt/EXP-Windows'

cat >"/bin/exploitw" <<-EOF
  sudo bash /opt/EXP-Windows/main.sh

  if [ $1 = "-r" ]; then
    sudo rm -r '/opt/EXP-Windows/'
    sudo rm -rf '/bin/exploitw'
    echo "EXP-Windows Was Uninstalled"
  fi
EOF
    echo "EXP-Windows Was Installed"
  fi
fi
