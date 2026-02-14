#!/usr/bin/env bash
# Task 4: create a temp directory and clean it up on exit / Ctrl+C

tmpdir=$(mktemp -d) || { echo "Failed to create temp dir" >&2; exit 1; }

cleanup() 
{
    echo
    echo "Cleaning up: $tmpdir"
    rm -rf "$tmpdir"
}

trap 'cleanup' EXIT INT TERM

echo "Using temporary directory: $tmpdir"
echo "Press Ctrl+C to interrupt or wait 30 seconds..."
sleep 30

echo "Done. Exiting normally."
