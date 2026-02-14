#!/bin/bash
# Menu-driven script using 'dialog' utility
# Menu:
#   - Date/time  : show current system date & time (infobox)
#   - Calender   : show current month calendar (infobox)
#   - Delete     : select and delete a file from a directory
#   - Exit       : exit the script

#---------------------#
#  Show Date & Time   #
#---------------------#
show_datetime()
{
    # Show current date/time in an infobox
    # --backtitle : text at the top of screen
    # --title     : window title
    # --infobox   : information box, auto-closes (no OK button)
    dialog --backtitle "Linux Shell Tutorial" \
           --title "System date and Time" \
           --infobox "Date is $(date)" 3 40

    # Pause so user can read the infobox
    read
    return
}

#---------------------#
#  Show Calendar      #
#---------------------#
show_cal()
{
    # Save calendar output to a temp file
    cal > menuchoice.temp.$$

    # Display calendar contents via infobox
    dialog --backtitle "Linux Shell Tutorial" \
           --title "Calender" \
           --infobox "$(cat menuchoice.temp.$$)" 10 25

    # Wait so user can read
    read

    # Remove temporary file
    rm -f menuchoice.temp.$$
    return
}

#---------------------#
#  Delete a File      #
#---------------------#
delete_file()
{
    # Ask user for directory; empty => current directory
    dialog --backtitle "Linux Shell Tutorial" \
           --title "Delete file" \
           --inputbox "Enter directory path (Enter for Current Directory)" \
           10 40 2>/tmp/dirip.$$

    rtval=$?

    # If user pressed "Cancel" or ESC, abort this function
    case $rtval in
        1)   rm -f /tmp/dirip.$$ ; return ;;
        255) rm -f /tmp/dirip.$$ ; return ;;
    esac

    # Read the directory name entered by user
    mfile=$(cat /tmp/dirip.$$)

    # If empty, use all files in current directory
    if [ -z "$mfile" ]
    then
        mfile="$(pwd)"/*
    else
        # If user did NOT include a wildcard '*', append '/*'
        # (grep returns 1 if '*' not found)
        grep "\*" /tmp/dirip.$$ >/dev/null 2>&1
        if [ $? -eq 1 ]
        then
            mfile="$mfile"/*
        fi
    fi

    # Build a list of regular files with labels for the menu
    # each line: "<filename> Delete?"
    for i in $mfile
    do
        if [ -f "$i" ]
        then
            echo "$i Delete?" >> /tmp/finallist.$$
        fi
    done

    # Show a menu of files to delete
    # The list /tmp/finallist.$$ must contain pairs: tag item
    dialog --backtitle "Linux Shell Tutorial" \
           --title "Select File to Delete" \
           --menu "Use [Up][Down] to move, [Enter] to select file" \
           20 60 12 $(cat /tmp/finallist.$$) 2>/tmp/file2delete.tmp.$$

    rtval=$?

    # Which file did the user choose? (the "tag" part)
    file2erase=$(cat /tmp/file2delete.tmp.$$)

    case $rtval in
        0)  # User selected a file and pressed OK

            # Ask for confirmation
            dialog --backtitle "Linux Shell Tutorial" \
                   --title "Are you sure?" \
                   --yesno "\n\nDo you want to delete : $file2erase " 10 60

            if [ $? -eq 0 ] ; then
                # User confirmed deletion, try to remove the file
                rm -f "$file2erase"
                if [ $? -eq 0 ] ; then
                    # Deletion successful
                    dialog --backtitle "Linux Shell Tutorial" \
                           --title "Information: Delete Command" \
                           --infobox "File: $file2erase is successfully deleted, Press a key" 5 60
                    read
                else
                    # Error during deletion
                    dialog --backtitle "Linux Shell Tutorial" \
                           --title "Error: Delete Command" \
                           --infobox "Error deleting File: $file2erase, Press a key" 5 60
                    read
                fi
            else
                # User canceled deletion at the yes/no prompt
                dialog --backtitle "Linux Shell Tutorial" \
                       --title "Information: Delete Command" \
                       --infobox "File: $file2erase is not deleted, Action is canceled, Press a key" 5 60
                read
            fi
            ;;
        1)   # Cancel from file menu
             rm -f /tmp/dirip.$$ /tmp/finallist.$$ /tmp/file2delete.tmp.$$
             return ;;
        255) # ESC from file menu
             rm -f /tmp/dirip.$$ /tmp/finallist.$$ /tmp/file2delete.tmp.$$
             return ;;
    esac

    # Final cleanup of temp files
    rm -f /tmp/dirip.$$ /tmp/finallist.$$ /tmp/file2delete.tmp.$$
    return
}

#---------------------#
#  Main Menu Loop     #
#---------------------#
while true
do
    dialog --clear --title "Main Menu" \
           --menu "To move [UP/DOWN] arrow keys \n\
[Enter] to Select\n\
Choose the Service you like:" 20 51 4 \
           "Date/time" "To see System Date & Time" \
           "Calender"  "To see Calender" \
           "Delete"    "To remove file" \
           "Exit"      "To exit this Program" 2> menuchoice.temp.$$

    retopt=$?

    choice=$(cat menuchoice.temp.$$)
    rm -f menuchoice.temp.$$

    case $retopt in
        0)
            case $choice in
                Date/time) show_datetime ;;
                Calender)  show_cal ;;
                Delete)    delete_file ;;
                Exit)      break ;;   # <-- just break out of while-loop
            esac
            ;;
        1)   break ;;                  # Cancel
        255) break ;;                  # ESC
    esac
done

clear    # <-- now this runs after you choose Exit/Cancel/ESC