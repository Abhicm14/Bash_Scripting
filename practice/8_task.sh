#!/usr/bin/env bash
# Task 8: collect a note via dialog, store in temp file, cleanup on exit

tmpfile=$(mktemp) || { echo "Failed to create temp file" >&2; exit 1; }

cleanup() {
    # Non-critical errors during rm go to /dev/null
    rm -f "$tmpfile" 2>/dev/null
}
trap 'cleanup' EXIT

note=$(dialog --backtitle "Notes" --title "Add Note" \
              --stdout --inputbox "Enter a short note:" 8 60) || {
    clear
    echo "User cancelled."
    exit 1
}

timestamp=$(date +'%Y-%m-%d %H:%M:%S')
printf '[%s] %s\n' "$timestamp" "$note" >>"$tmpfile" 2>/dev/null

dialog --backtitle "Notes" --title "Saved" \
       --msgbox "Your note was saved to:\n\n$tmpfile" 8 60

clear
echo "Notes stored in: $tmpfile"
echo "Current contents:"
cat "$tmpfile"
