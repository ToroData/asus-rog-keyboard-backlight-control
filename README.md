# Asus Rog Keyboard Backlight Control

This tutorial will guide you through the steps necessary to configure the function keys `F2`, `F3`, and `F4` to control the keyboard backlight on your ASUS ROG Strix with Arch Linux using `asusctl` and `sxhkd`.

> [!WARNING]  
> If you are using **Ubuntu or another Debian-based distribution with GNOME**, do not follow this guide.  
> Instead, go to [`bash/README.md`](./bash/README.md) for the proper instructions for your system.

## Requirements

- Arch Linux
- `asusctl` installed from AUR
- `sxhkd` configured and running
- Existing directory `~/.config/bspwm/sxhkdrc`. If you do not have bspwm, failing that, know the configuration directory of `sxhkd`.

## Installation

### Step 1: Install `asusctl` from AUR

If you don't have `yay` installed, install it first:

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Then, install `asusctl`:

```bash
yay -S asusctl
```

### Step 2: Copy the script to change lighting modes to the appropriate directory

1. Create the directory `~/.local/bin` if it doesn't exist:

   ```bash
   mkdir -p ~/.local/bin
   ```

2. Copy the file `cycle_led_modes.sh`:

   ```bash
   cp cycle_led_modes.sh ~/.local/bin/cycle_led_modes.sh
   ```

3. Make the script executable:

   ```bash
   chmod +x ~/.local/bin/cycle_led_modes.sh
   ```

### Step 3: Run the Script to Append the Configurations

1. Move to the directory where the `append_to_sxhkdrc.sh` and `sxhkdrc_append`file is

2. Run the script to append the configurations to `sxhkdrc`:

   ```bash
   ./append_to_sxhkdrc.sh
   ```

   If your `sxhkdrc` file is in a different location, provide the path as an argument:

   ```bash
   ./append_to_sxhkdrc.sh /path/to/your/sxhkdrc
   ```

## Included Files

- `cycle_led_modes.sh`: Script to cycle through keyboard lighting modes.
- `sxhkdrc_append`: Configurations to append to `sxhkdrc`.
- `append_to_sxhkdrc.sh`: Script to append the configurations to `sxhkdrc`.

## Authors

- [@ToroData](https://www.github.com/ToroData)

## License

[MIT](https://choosealicense.com/licenses/mit/)
