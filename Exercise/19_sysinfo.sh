#!/bin/bash
# Script: sysinfo.sh
# Purpose: Show various system configuration details (1–14)

# Temporary file to store all output
TMPFILE="/tmp/info.$$"

# 7) Number of currently logged-in users
nouser=$(who | wc -l)

# Collect all information into TMPFILE
{
    # 1) Currently logged user and his logname
    echo -e "1) User name: $USER (Login name: $LOGNAME)"

    # 2) Your current shell
    echo -e "2) Current Shell: $SHELL"

    # 3) Your home directory
    echo -e "3) Home Directory: $HOME"

    # 4) Your operating system type
    # OSTYPE is a bash variable; if empty, fall back to uname
    echo -e "4) Your O/S Type: ${OSTYPE:-$(uname -o 2>/dev/null || uname -s)}"

    # 5) Your current PATH setting
    echo -e "5) PATH: $PATH"

    # 6) Your current working directory
    echo -e "6) Current directory: $(pwd)"

    # 7) Currently logged number of users
    echo -e "7) Currently Logged: $nouser user(s)"

    # 8) About your OS and version, release number, kernel version
    echo
    echo -e "8) OS and Version Information:"
    if [ -f /etc/os-release ]; then
        # Generic Linux OS info
        cat /etc/os-release
    fi

    if [ -f /etc/redhat-release ]; then
        # RHEL/CentOS specific
        echo -e "OS (RedHat-style): $(cat /etc/redhat-release)"
    fi

    echo -e "Kernel Version: $(uname -r)"
    echo -e "Kernel Release: $(uname -v)"

    # 9) Show all available shells
    if [ -f /etc/shells ]; then
        echo
        echo -e "9) Available Shells:"
        cat /etc/shells
    fi

    # 10) Show mouse settings (RHEL-style location)
    if [ -f /etc/sysconfig/mouse ]; then
        echo
        echo -e "--------------------------------------------------------------------"
        echo -e "10) Computer Mouse Information:"
        echo -e "--------------------------------------------------------------------"
        cat /etc/sysconfig/mouse
    fi

    # 11) Show computer CPU information
    echo
    echo -e "--------------------------------------------------------------------"
    echo -e "11) Computer CPU Information:"
    echo -e "--------------------------------------------------------------------"
    if [ -r /proc/cpuinfo ]; then
        cat /proc/cpuinfo
    else
        echo "CPU info not available (/proc/cpuinfo missing)."
    fi

    # 12) Show memory information
    echo
    echo -e "--------------------------------------------------------------------"
    echo -e "12) Computer Memory Information:"
    echo -e "--------------------------------------------------------------------"
    if [ -r /proc/meminfo ]; then
        cat /proc/meminfo
    else
        echo "Memory info not available (/proc/meminfo missing)."
    fi

    # 13) Show hard disk information
    echo
    echo -e "--------------------------------------------------------------------"
    echo -e "13) Hard disk information:"
    echo -e "--------------------------------------------------------------------"
    # Old-style IDE device info; may not exist on modern systems
    if [ -d /proc/ide/hda ]; then
        echo -e "Model:  $(cat /proc/ide/hda/model)"
        echo -e "Driver: $(cat /proc/ide/hda/driver)"
        echo -e "Cache:  $(cat /proc/ide/hda/cache)"
    else
        echo "Legacy /proc/ide/hda not found. On modern systems, use commands like:"
        echo "  lsblk, lshw -class disk, or fdisk -l"
    fi

    # 14) File system (Mounted)
    echo
    echo -e "--------------------------------------------------------------------"
    echo -e "14) File System (Mounted):"
    echo -e "--------------------------------------------------------------------"
    if [ -r /proc/mounts ]; then
        cat /proc/mounts
    else
        # Fallback
        mount
    fi

} > "$TMPFILE"

# Display the collected information
if command -v dialog >/dev/null 2>&1; then
    dialog --clear \
           --backtitle "Linux Software Diagnostics (LSD) Shell Script Ver.1.0" \
           --title "System Information (Use Up/Down keys to scroll)" \
           --textbox "$TMPFILE" 21 70
    clear           # <-- clear terminal after closing the textbox
else
    # If dialog is not installed, just show in pager
    less "$TMPFILE"
fi

# Clean up temporary file
rm -f "$TMPFILE"