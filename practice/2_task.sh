#! /bin/bash

APP_MODE="dev"

run_child()
{
	local APP_MODE="prod"
	export APP_MODE

	echo "In run_child() - env shows:"
	env | grep '^APP_MODE='
	echo
}

echo "Before run_child() - env shows (likely nothing yet):"
env | grep '^APP_MODE=' || echo "APP_MODE not in environment"
echo

run_child
echo

echo "After run_child() - env shows:"
env | grep '^APP_MODE=' || echo "APP_MODE not in environment"
echo

echo "Shell variable APP_MODE in main shell: $APP_MODE"
