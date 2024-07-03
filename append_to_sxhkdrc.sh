#!/bin/bash

# Default path to sxhkdrc
default_sxhkdrc_path="$HOME/.config/bspwm/sxhkdrc"

# Check if an argument is provided, otherwise use the default path
sxhkdrc_path="${1:-$default_sxhkdrc_path}"

append_file="sxhkdrc_append"

if [ -f "$sxhkdrc_path" ]; then
    cat "$append_file" >> "$sxhkdrc_path"
    echo "Configurations added to $sxhkdrc_path"
else
    echo "The file $sxhkdrc_path does not exist"
fi

# Restart sxhkd to apply the changes
pkill -USR1 -x sxhkd
