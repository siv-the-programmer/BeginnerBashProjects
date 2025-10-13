#!/bin/bash
# This line tells the system to use the Bash shell to run the script

#---------------- Functions ----------------
# Function: freq
# Purpose: Count word frequency in a given file and show the top 5
freq(){
    # 'tr -s " " "\n"' replaces spaces with newlines (so each word is on its own line).
    #   - 'tr' = translate or delete characters
    #   - '-s' = squeeze repeats (removes extra spaces, so multiple spaces become one)
    # '< "$fpath"' tells tr to read input from the file stored in the variable fpath.
    tr -s ' ' '\n' < "$fpath" |

    # 'sort' arranges all words alphabetically.
    sort |

    # 'uniq -c' collapses duplicates, prefixing each unique word with a count.
    uniq -c |

    # 'sort -nr' sorts again:
    #   -n = numerical sort
    #   -r = reverse order (so highest counts appear first).
    sort -nr |

    # 'head -n 5' shows only the first 5 results (top 5 words).
    head -n 5
}

#---------------- Main ----------------
# Function: main_func
# Purpose: Ask the user for a text file path, check if it exists,
#          and if so, call the freq function to process it.
main_func(){
    # Prompt the user for a file path
    echo "txt file path? >"

    # 'read fpath' waits for user input and saves it in the variable fpath
    read fpath

    # Check if the file exists (-e checks if a path exists)
    if [ -e "$fpath" ]; then
        # If the file exists, print a header message
        echo "Top 5 most common words in $fpath:"

        # Call the freq function to calculate and display results
        freq
    else
        # If the path doesn't exist, print an error message
        echo "Incorrect or invalid file path"
    fi
}

# Call the main function to start the script
main_func
