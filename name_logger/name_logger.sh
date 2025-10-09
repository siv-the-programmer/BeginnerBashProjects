#!/bin/bash
#--------------------------------------------------------------------------------------------------
# NAME LOGGER
# Author: https://github.com/siv-the-programmer

# This Script is a name logger, it asks the user for their name and adds it to a file <name_log.txt>
#---------------------------------------------------------------------------------------------------
# What you learn in this script
#
# $echo, $read
# Variables
# if and else statements
#--------------------------------------------------------------------------------------------------

# clear screen
clear

# Small Banner
echo """

  NAME LOGGER
  ----------by https://github.com/siv-the-programmer

"""
#------------Name-prompt-----------

echo "What is your name? > "
read your_name

#------------date-format-----------

day=$(date +%F)

#------------Add-to-txt------------

# Add your name and date together in the name_log.txt
echo "$your_name""_$day" >>name_log.txt

#-----------Checklist-------------
# Check if file exists, if the file exists it echo's logged succesful
# if file does not exists prints error and exit code 1 

if [ -e "name_log.txt" ];
then
   echo "logged succesful"
else
   echo "error" && "exit 1"
fi
