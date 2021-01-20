#!/bin/bash
########################################
## PEGASUS High Bash Script           ##
## MIT License                        ##
## Copyright (c) Cadet Jazmine Zajac  ##
########################################

until [ $input -eq -1 ]
do
  echo ""
  echo "type -1 to leave script"
  echo "0   List all services"
  echo "1   Search for a file"
  echo "2   List all users"
  echo "3   List all groups"
  echo ""
  read input

  if [ $input -eq 0 ]; then
    printf "Listing services..."
    service --status-all

  elif [ $input -eq 1 ]; then
    echo "What file do you want to find?"
    read filename
    find $filename
    readlink -f $filename

  elif [ $input -eq 2 ]; then
    printf "Listing users:"
    sudo cat /etc/passwd

  elif [ $input -eq 3 ]; then
    printf "Listing groups:"
    sudo cat /etc/group
  fi

done
