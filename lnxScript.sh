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
  echo "1   Search unauthorized files"
  echo "2   User and Groups"
  echo ""
  read input

  if [ $input -eq 0 ]; then
    printf "list all services..."

  elif [ $input -eq 1 ]; then
    printf "Search unauthorized files..."

  elif [ $input -eq 2 ]; then
    printf "User and Groups..."
  fi

done
