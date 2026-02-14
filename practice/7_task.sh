#!/usr/bin/env bash
# Task 7: confirm deletion via dialog

if [ $# -lt 1 ]; then
    echo "Usage: $0 filename" >&2
    exit 1
fi

file=$1

if [ ! -e "$file" ]; then
    echo "File '$file' does not exist." >&2
    exit 1
fi

dialog --backtitle "Delete File" --title "Confirm Deletion" \
       --yesno "Do you really want to delete:\n\n$file ?" 10 60

case $? in
    0)
        rm -f -- "$file"
        dialog --backtitle "Delete File" --title "Result" \
               --msgbox "File deleted:\n\n$file" 8 60
        ;;
    1)
        dialog --backtitle "Delete File" --title "Result" \
               --msgbox "File NOT deleted." 6 40
        ;;
    255)
        dialog --backtitle "Delete File" --title "Result" \
               --msgbox "Operation cancelled (ESC pressed)." 6 50
        ;;
esac

clear
