#!/bin/bash
# Script: menu_dialog.sh
# Purpose: Implement menu using dialog utility with options:
#          1) Date/time (infobox)
#          2) Calendar (infobox)
#          3) Delete selected file
#          4) Exit

#---------------- Functions ----------------#

show_datetime() {
    # Show current date and time using infobox
    dialog --title "Current Date & Time" \
           --infobox "$(date)" 7 40
    sleep 3    # infobox is non-interactive, pause so user can see it
}

show_calendar() {
    # Show current month's calendar using infobox
    dialog --title "Current Month Calendar" \
           --infobox "$(cal)" 12 25
    sleep 5
}

delete_file() {
    local dir tmp choice filepath errfile
    tmp=$(mktemp)

    # Ask for directory name (blank = current directory)
    dialog --title "Delete File" \
           --inputbox "Enter directory containing files (leave blank for current directory):" \
           8 60 2>"$tmp"
    [ $? -ne 0 ] && { rm -f "$tmp"; return; }   # Cancel/ESC
    dir=$(<"$tmp")
    rm -f "$tmp"

    [ -z "$dir" ] && dir="."

    # Validate directory
    if [ ! -d "$dir" ]; then
        dialog --title "Error" --msgbox "\"$dir\" is not a directory." 7 50
        return
    fi

    # Build list of regular files in that directory
    local opts=()
    local f base
    for f in "$dir"/*; do
        [ -f "$f" ] || continue      # only regular files
        base=${f##*/}                # basename
        opts+=("$base" "")           # tag=item=filename
    done

    if [ ${#opts[@]} -eq 0 ]; then
        dialog --title "Delete File" \
               --msgbox "No regular files found in directory:\n$dir" 8 60
        return
    fi

    # Show menu of files to select from
    tmp=$(mktemp)
    dialog --title "Delete File" \
           --menu "Select the file you want to delete (directory: $dir)" \
           20 60 15 \
           "${opts[@]}" 2>"$tmp"
    [ $? -ne 0 ] && { rm -f "$tmp"; return; }    # Cancel/ESC
    choice=$(<"$tmp")
    rm -f "$tmp"

    filepath="$dir/$choice"

    # Confirmation
    dialog --title "Confirm Delete" \
           --yesno "Are you sure you want to delete:\n$filepath" 8 60
    if [ $? -ne 0 ]; then
        return
    fi

    # Try to delete and report any errors
    errfile=$(mktemp)
    if rm -- "$filepath" 2>"$errfile"; then
        dialog --title "Delete File" \
               --msgbox "File deleted successfully:\n$filepath" 7 60
    else
        dialog --title "Error Deleting File" \
               --msgbox "Error while deleting file:\n$(<"$errfile")" 10 60
    fi
    rm -f "$errfile"
}

main_menu() {
    while true; do
        choice=$(dialog --clear \
                        --title "Main Menu" \
                        --menu "Select an option:" \
                        15 50 6 \
                        1 "Date/Time" \
                        2 "Calendar" \
                        3 "Delete File" \
                        4 "Exit" \
                        3>&1 1>&2 2>&3)

        exit_status=$?
        clear

        # If user presses Cancel or ESC, also exit
        [ $exit_status -ne 0 ] && break

        case "$choice" in
            1) show_datetime ;;
            2) show_calendar ;;
            3) delete_file ;;
            4) break ;;
        esac
    done
}

#----------------- Main --------------------#

# Ensure dialog is installed (optional simple check)
if ! command -v dialog >/dev/null 2>&1; then
    echo "Error: 'dialog' utility not found. Install it and run again."
    exit 1
fi

main_menu
clear