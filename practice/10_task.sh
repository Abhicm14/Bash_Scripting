#!/usr/bin/env bash
# Task 10: backup script with getopts, trap, dialog, and /dev/null

srcdir=""
destdir=""
quiet=0
interactive=0

usage() {
    cat >&2 <<EOF
Usage: $0 -s srcdir -d destdir [-q] [-i]

  -s srcdir   Source directory to backup (required)
  -d destdir  Destination directory for backups (required)
  -q          Quiet mode: suppress tar output
  -i          Interactive: confirm with dialog and ask for optional label
EOF
    exit 1
}

while getopts ":s:d:qi" opt; do
    case "$opt" in
        s) srcdir="$OPTARG" ;;
        d) destdir="$OPTARG" ;;
        q) quiet=1 ;;
        i) interactive=1 ;;
        \?) echo "Unknown option: -$OPTARG" >&2; usage ;;
        :)  echo "Option -$OPTARG requires an argument" >&2; usage ;;
    esac
done
shift $((OPTIND - 1))

[ -z "$srcdir" ] && { echo "Error: -s srcdir is required." >&2; usage; }
[ -z "$destdir" ] && { echo "Error: -d destdir is required." >&2; usage; }

if [ ! -d "$srcdir" ]; then
    echo "Error: source directory '$srcdir' does not exist." >&2
    exit 1
fi

mkdir -p "$destdir" || { echo "Error: cannot create dest dir '$destdir'" >&2; exit 1; }

tmpdir=$(mktemp -d) || { echo "Failed to create temporary dir" >&2; exit 1; }

cleanup() {
    rm -rf "$tmpdir" 2>/dev/null
}
trap 'cleanup' EXIT

label=""

if [ "$interactive" -eq 1 ]; then
    # Confirm running backup
    dialog --backtitle "Backup" --title "Confirm Backup" \
           --yesno "Create a backup of:\n\n$srcdir\n\nDestination:\n$destdir" 12 60
    case $? in
        0) : ;;      # Yes
        1|255)
            clear
            echo "Backup cancelled."
            exit 1
            ;;
    esac

    # Ask for optional label
    label=$(dialog --backtitle "Backup" --title "Backup Label" --stdout \
                   --inputbox "Enter optional label for this backup (leave empty for none):" 9 60) || {
        clear
        echo "Backup cancelled."
        exit 1
    }
    clear
fi

timestamp=$(date +'%Y%m%d-%H%M%S')
# Sanitize label: replace spaces with underscores and strip non-word chars
if [ -n "$label" ]; then
    label_sanitized=$(echo "$label" | tr ' ' '_' | tr -cd '[:alnum:]_-')
    archive_name="backup-${timestamp}-${label_sanitized}.tar.gz"
else
    archive_name="backup-${timestamp}.tar.gz"
fi

archive_path="$destdir/$archive_name"

backup() {
    # Use tar; store the directory as a single top-level entry
    local src_base
    src_base=$(basename "$srcdir")
    ( cd "$(dirname "$srcdir")" && tar czf "$archive_path" "$src_base" )
}

if [ "$quiet" -eq 1 ]; then
    backup >/dev/null 2>&1
else
    echo "Creating backup..."
    backup
fi

if [ $? -eq 0 ]; then
    echo "Backup created successfully:"
    echo "  Source:      $srcdir"
    echo "  Destination: $archive_path"
else
    echo "Backup failed." >&2
    exit 1
fi
