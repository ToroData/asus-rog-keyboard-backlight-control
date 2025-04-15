#!/bin/bash

set -e

# Check if asusctl is installed
if ! command -v asusctl &> /dev/null; then
    echo "Error: 'asusctl' is not installed. Aborting keybinding configuration."
    exit 1
fi

# Function to add a GNOME custom shortcut
add_shortcut() {
    local name="$1"
    local command="$2"
    local binding="$3"

    # Get current custom keybindings
    existing=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
    existing=${existing//[\[\]\' ]/}
    IFS=, read -ra paths <<< "$existing"

    new_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$((${#paths[@]}))/"
    paths+=("$new_path")

    # Register new keybinding
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$(printf "[%s]" "$(IFS=,; echo "${paths[*]}")")"

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$new_path name "$name"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$new_path command "$command"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$new_path binding "$binding"
}

# Create F2 and F3 brightness control shortcuts
add_shortcut "Decrease ASUS keyboard brightness" "asusctl --prev-kbd-bright" "<F2>"
add_shortcut "Increase ASUS keyboard brightness" "asusctl --next-kbd-bright" "<F3>"

echo "Keyboard brightness shortcuts (F2 and F3) configured successfully."
echo "You can now use F2 to decrease and F3 to increase the ASUS keyboard brightness."
echo "If you encounter any issues, please check the GNOME settings or the asusctl documentation."