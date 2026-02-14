#! /bin/bash

log_file="script.log"

exec 3>>"$log_file"

log()
{
	printf '%s %s\n' "$(date +'%Y-%m-%d %H:%M:%S')" "$*" >&3
}

log "Script started"

{
	echo "Listing /tmp and a non-existent directory"
	ls -l /tmp
	ls -l /no/such/path
} >&3 2>&1

log "Script finished"

exec 3>&-
echo "Log written to: $log_file"

