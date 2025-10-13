#!/bin/bash
#--------------------------
# Top 10 beginner projects
# Simple backup program
# Author: Sivario.B
#------------------------

# filecounter

#----------------Clear-Screen-----------------

# clear screen function
cls()
{
clear
}
cls
#----------------Count-Function---------------

# count function/counts how much files in the dir
count_func()
{
count=$(ls "$dir" | wc -l)

   echo "$count files in $dir"
}
#---‐------------List-Function----------------

# lists all the files in that directory
list()
{
ls "$dir"
}
#----------------Main-Function----------------

# main
main()
{
while true; do
#----------------Banner-----------------------
   echo """

     FILE COUNTER
                by Sivario.B

"""
#---------------------------------------------
#              AUTHOR: <  >
#--------------Directory-Prompt---------------

# Ask user what directory they want  to check
   echo "Enter a directory > "
read dir
#------------------Main--‐-------------------

# If the directory exists then run the count function
if [ -e "$dir" ]; then
count_func
list
else
   echo "directory not found"
fi
#----------------Exit-------------------------

# exit prompt
# read -n1 does not need you to press enter
   echo "do you want to exit? y/n"
read -n1 ex

# If user presses y the script will exit
# If user presses n the scfipt will continue
if [ "$ex" = "y" ] || [ "$ex" = "Y" ];
then

exit

else
continue

fi
done
}
#---------‐------Start-Script----------------------------
main
