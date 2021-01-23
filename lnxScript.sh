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
  echo "4   Find harmful files:"
  echo "5   Find who doesn't have a password"
  echo "6   I forgot what this does"
  echo "7   Change the password for a user"
  echo "8   Activate a service"
  echo "9   Change the group of a user"
  echo "10  Stop a service"
  echo "11  List active internet connections"
  echo ""
  read input

  if [ $input -eq 0 ]; then
    printf "Listing services..."
    service --status-all

  elif [ $input -eq 1 ]; then
    echo "What file do you want to find?"
    read filename
    echo "What directory?"
    read directory
    find $directory -type f -name $filename    

  elif [ $input -eq 2 ]; then
    printf "Listing users:"
    sudo cat /etc/passwd

  elif [ $input -eq 3 ]; then
    printf "Listing groups:"
    sudo cat /etc/group

  elif [ $input -eq 4 ]; then 
    echo "What directory?"
    read directory
    sudo find $directory -iregex ".*\.\(jpg\|gif\|jpeg\|aac\|ac3\|avi\|aiff\|bat\|bmp\|exe\|flac\|mov\|m3u\|m4p\|mp2\|mp3\|mp4\|mpeg4\|midi\|msi\|ogg\|png\|txt\|sh\|wav\|wma\|wqf\)$"

  elif [ $input -eq 5 ]; then 
    printf "Printing..."
    sudo cat /etc/shadow

  elif [ $input -eq 6 ]; then
    echo "What user?"
    read givenUser
    sudo passwd -d $givenUser

  elif [ $input -eq 7 ]; then
    echo "What user?"
    read userForPasswd
    sudo passwd $userForPasswd

  elif [ $input -eq 8 ]; then
    echo "What service do you want to activate?"
    read activateServ
    sudo systemctl enable --now  $activateServ

  elif [ $input -eq 9 ]; then 
    echo "What user?"
    read userToGroup
    echo "Group to change it to:"
    read GroupForUser
    sudo usermod -g $GroupForUser $userToGroup

  elif [ $input -eq 10 ]; then
    echo "What service do you want to deactivate?"
    read deactivateServ
    sudo systemctl stop $deactivateServ
    
  elif [ $input -eq 11 ]; then
    printf "Listing..."
    sudo netstat -lp

  fi

done
