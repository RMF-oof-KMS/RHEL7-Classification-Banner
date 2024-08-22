#!/usr/bin/env bash

# Get the active user's session ID
SESSION=$(loginctl | grep $(who | awk '{print $1}') | grep "seat0" | awk '{print $1}')

# Determine the desktop environment (GNOME or KDE)
DESKTOP_ENVIRONMENT=$(loginctl show-session $SESSION -p Type | cut -d'=' -f2)

# Get the DISPLAY environment variable based on the desktop environment
if [[ "$DESKTOP_ENVIRONMENT" == "x11" || "$DESKTOP_ENVIRONMENT" == "wayland" ]]; then
    DISPLAY=$(loginctl show-session $SESSION -p Display | cut -d'=' -f2)
else
    # Fallback method for KDE, which may not provide a Display property
    DISPLAY=$(ps -u $(whoami) -o pid=,cmd= | grep -E 'kdeinit5|kwin' | awk '{print ":0"}' | head -n1)
fi

echo $DISPLAY
