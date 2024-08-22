#!/bin/bash

# Get the active user's session ID
SESSION=$(loginctl | grep $(who | awk '{print $1}') | grep "seat0" | awk '{print $1}')

# Get the display environment variable
DISPLAY=$(loginctl show-session $SESSION -p Display | cut -d'=' -f2)

echo $DISPLAY
