#!/usr/bin/env bash
# Task 9: dialog menu + getopts + logging

logfile="/tmp/menu.log"
verbose=0

usage() {
    echo "Usage: $0 [-l logfile] [-v]" >&2
    exit 1
}

while getopts ":l:v" opt; do
    case "$opt" in
        l) logfile="$OPTARG" ;;
        v) verbose=1 ;;
        \?) echo "Unknown option: -$OPTARG" >&2; usage ;;
        :)  echo "Option -$OPTARG requires an argument" >&2; usage ;;
    esac
done
shift $((OPTIND - 1))

log() {
    local msg="$1"
    printf '%s %s\n' "$(date +'%Y-%m-%d %H:%M:%S')" "$msg" >>"$logfile"
    if [ "$verbose" -eq 1 ]; then
        echo "$msg"
    fi
}

cleanup() {
    clear
}
trap 'cleanup' EXIT

show_date() {
    local now
    now=$(date)
    log "User requested date: $now"
    dialog --backtitle "Menu App" --title "Current Date" \
           --msgbox "$now" 8 50
}

ask_username() {
    local username
    username=$(dialog --backtitle "Menu App" --title "Username" \
                      --stdout --inputbox "Enter a username:" 8 40) || return 1
    log "User entered username: $username"
    dialog --backtitle "Menu App" --title "Username Saved" \
           --msgbox "Username saved: $username" 8 40
}

show_log_path() {
    dialog --backtitle "Menu App" --title "Log File" \
           --msgbox "Log file path:\n\n$logfile" 8 60
}

confirm_quit() {
    dialog --backtitle "Menu App" --title "Quit" \
           --yesno "Are you sure you want to quit?" 8 40
    return $?   # 0=yes, 1=no
}

# Main menu loop
while :; do
    choice=$(dialog --backtitle "Menu App" --title "Main Menu" --stdout \
                    --menu "Choose an option:" 15 60 6 \
                    1 "Show date" \
                    2 "Ask for a username" \
                    3 "Show log file path" \
                    4 "Quit")

    status=$?
    [ $status -ne 0 ] && break

    case "$choice" in
        1) show_date ;;
        2) ask_username ;;
        3) show_log_path ;;
        4)
            if confirm_quit; then
                log "User chose to quit."
                break
            else
                log "User cancelled quit."
            fi
            ;;
    esac
done
