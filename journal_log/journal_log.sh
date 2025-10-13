# !bin/bash
#--------------------------------------------------------
# Top 10 beginner bash projects
# Thought of the day program in bash
# Author: Sivario.B
# --------------------------------------------------------
# WHAT IS FOCUSED ON:
#
# echo command, read command, %F(full date format)
# if and else statement
# Creating variables
# Logging input to a .txt file
# Comments and readable code
# Section script for readability
# Logging exit status in a log.txt file
#--------------------------------------------------------
#clear the screen
clear
#--------------------Banner---------------------------
echo """

        THOUGHT OF THE DAY
                          by Sivario.B

"""
#--------------------Prompt1----------------------------

# Ask the user for their thought of the day
echo " What is your thought of the day to store away? "
echo
read thought
#-------------------Function--------------------------

# Add the users thought or note to a file called thoughts.txt
day=$(date +%F)
   echo "$thought" "/$day" >>thoughts.txt
   echo "Noted successfully"
#------------------Prompt2----------------------------

# Ask the user if they would like to see the notes they just added
   echo "Do you want to see your notes (y/n)?"
read notes
#------------------Choice----------------------------

# If typed (y) the program will cat the journal.txt displaying the noted they wrote
# if typed anything else the program will exit
if [ "$notes" = "y" ] || [ "$notes" = "Y" ];
then
   cat thoughts.txt
   echo exit 0 >>log.txt
elif [ "$notes" = "n" ] || [ "$notes" = "N" ];
then
   echo "Process finished"
   echo exit 1 >>log.txt
fi