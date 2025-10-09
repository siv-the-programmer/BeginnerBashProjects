# !/bin/bash
#--------------------------
# Simple backup program
# Author: https://github.com/siv-the-programmer
#------------------------
# This Program backs up a file you want to a path you specify
# It then logs the action in a baclog.txt
# Clear screen
clear

#--------Banner-------------
echo """

    SIMPLE FILE BACKUP WITH LOGGING
    -------------------------------------------
                                   by Sivario.B

"""

#--------Variables----------
# Path is the file you want to backup and back is the place you want it to backup to
path="ENTER-FILE-TO-BACKUP"
bac="WHERE-TO-BACKUP"
logx="baclog.txt"
day=$(date +%F//+%T)

#---------Main---------------

# Checks if path exists
# If path exists then only will the file backup to the specified path
# Output will then be logged into a backlog.txt file with the date and time when the backup was executed

if [ -e "$path" ];
then
   cp -r "$path" "$bac"
   echo "file backup complete, check the baclog.txt for confirmation" && echo "files succesfully backed up" "/$day" >>"$logx"
   echo "$path was backed up to $bac" && echo "$path was backed up to $bac" >>"$logx"
# If the path does not exist then it will give a path error
# The error is then logged into the baclog.txt file
elif [ ! -e "$path" ];
then
   echo "path error" && echo "Files where not backed up succesful" "$day" >>"$logx"
else
   exit 2
fi