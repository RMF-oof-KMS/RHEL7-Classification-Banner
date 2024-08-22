#!/usr/bin/env bash

# Identify the active graphical session (whether root or another user)
USER_SESSION=$(loginctl list-sessions | awk '$4 == "seat0" {print $1}')

# Get the username associated with this session
USERNAME=$(loginctl show-session $USER_SESSION -p Name --value)

# Get the correct DISPLAY variable for the session
DISPLAY=$(loginctl show-session $USER_SESSION -p Display --value)

# Fallback for KDE if DISPLAY is empty
if [ -z "$DISPLAY" ]; then
    DISPLAY=$(ps -u $USERNAME -o cmd= | grep -Eo ' :[0-9]+' | head -n 1)
fi

# Export DISPLAY for the service
echo $DISPLAY
