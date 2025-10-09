#!/bin/bash

#--------------------------
# Simple backup program
# Author: https://github.com/siv-the-programmer
#------------------------
#Todo List(add, view and delete)
#-------------------------------------

# Add the txt file if it does not exist
touch notes.txt
# Clear the screen
clear
#-------------Functions---------------

# This is the add note/task function that allows the user to add notes into the notes.txt file 
add_task(){
   echo "What would you like to add?"
   read add_note # Ask the user for the task they would like to add
   echo
   echo "$add_note" >>notes.txt # Add the note what the user wrote to the notes.txt file
   echo "$add_note has been added to notes.txt" # Confirm the note has been added
   sleep 1
   clear
}

 # This is the cat or read function called kitty
 # This allows the user to view their notes
look(){
clear
kitty=$(cat notes.txt)
   echo "Your notes are:"
   echo
   echo "$kitty"
}

# This is the function that allows you to delete a note you dont want
delete() {
    echo "Which note number would you like to delete?" #ask the user the number they want to delete
    nl -w2 -s". " notes.txt # Sort the notes into numerical order, easier for deletion
    read delnum
    sed -i "${delnum}d" notes.txt # Delete the note based on the number it is , EG > 1. Note1, 2. Note2 [Which note number would you like to delete? 1 or 2]
    echo "Note $delnum deleted." # The note then gets deleted
    sleep 1
    clear
}

# This is the exit command
exi(){
echo "Exiting" # If the user presses number 4 then the program will exit
   sleep 1
   exit
}
#-------------MAIN--------------------
# This is the main screen for the user to see the options
# Added a while loop to keep the program running until the user feels they would like to exit 

main(){
while true; do
echo """

           TODO LIST

        1) Add a note
        2) View notes
        3) Delete a note
        4) Exit
"""

# This is the logic behind what number the user types for the options
# If the user presses 1, they get to add a note
# If the user presses number 2, it allows them to view their current notes
# If the user presses number 3, it allows them to delete/remove a specific note
# if the user presses number 4, it allows the user to exit the program\
# if the user presses and incorrect number or option, it will echo Incorrect number and go back to the options menu for further input
echo "Select an option"
   read add
if [ "$add" = "1" ];
then
   add_task

elif [ "$add" = "2" ]; then
   look
elif [ "$add" = "3" ]; then
   delete
elif [ "$add" = "4" ]; then
   exi
else
   echo "Incorrect number."

fi
done
}
main
