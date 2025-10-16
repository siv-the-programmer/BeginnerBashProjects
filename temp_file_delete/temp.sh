#!/bin/bash
# The shebang (#!) tells the system to use the Bash shell to interpret this script.

#------------------Functions------------------
delete_tmp(){
    # This function deletes all .tmp files in the directory the user provides.
    
    # Prompt the user for confirmation
    echo "Are you sure you want to delete all .tmp files? (y/n)"
    
    # Read the user’s answer into a variable called 'confirm'
    read confirm
    
    # If the user typed 'y' or 'Y', proceed with deletion
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        
        # 'find' searches inside the path stored in $tem
        # -type f   → look only for files (not folders)
        # -name "*.tmp" → match files ending with .tmp
        # -exec rm -f {} \; → delete each matching file
        find "$tem" -type f -name "*.tmp" -exec rm -f {} \;
        
        # Let the user know files were deleted
        echo "Temp files deleted."
    else
        # If the user didn’t say yes, cancel the operation
        echo "Operation canceled."
    fi
}

#------------------Main-function-----------------------
main(){
    # Ask the user where the temporary files are located
    echo "Enter path for temp files to be deleted:"
    
    # Read that path into the variable 'tem'
    read tem
    
    # Check if the path exists (-e tests for existence of a file/directory)
    if [ -e "$tem" ]; then
        # If path exists, call the delete_tmp function
        delete_tmp
    else
        # If path doesn’t exist, show error message
        echo "Path does not exist!"
    fi
}

# Call the main function to start the script
main
