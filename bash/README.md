# ASUS ROG Keyboard Backlight Control (GNOME / Ubuntu-based Systems)

This setup enables the `F2` and `F3` function keys to control the keyboard backlight brightness on ASUS ROG laptops using `asusctl` in Ubuntu or other Debian-based distributions running GNOME.

> [!WARNING]  
> This version is intended for **Ubuntu/GNOME users only**.  
> If you are using **Arch Linux with `sxhkd` or `bspwm`**, please refer to the main [`README.md`](../README.md).

## Requirements

- Ubuntu or a Debian-based system
- GNOME desktop environment
- Keyboard with ASUS backlight support
- `asusctl` compiled from source

## Installation

### Step 1: Clone the repository

```bash
git clone https://github.com/ToroData/asus-rog-keyboard-backlight-control.git
cd rog-keyboard-backlight-control/bash
```

### Step 2: Install asusctl

Run the provided installation script, which will automatically install dependencies and build asusctl:

```bash
chmod +x install_asusctl.sh
./install_asusctl.sh
```

If Rust and Cargo are not present or the build fails, the script will attempt to fix the environment and retry the compilation.

### Step 3: Configure Function Keys (F2, F3)

Once `asusctl` is installed, run the following script to register the keyboard shortcuts via GNOME:

```bash
chmod +x setup_keyboard_shortcuts.sh
./setup_keyboard_shortcuts.sh
```

This will bind:

- `F2` to: `asusctl --prev-kbd-bright`
- `F3` to: `asusctl --next-kbd-bright`
- No modifications are made to `F4` or lighting modes in this version.

## Included Files

- `install_asusctl.sh`: Script to install and compile asusctl from source.

- `setup_keyboard_shortcuts.sh`: Script to configure GNOME keybindings for keyboard backlight control.

## Notes

- This version is intended for GNOME and does **not** depend on `sxhkd` or window managers like `bspwm`.
- Lighting mode control (e.g., cycling through effects) is not included in this version.

## Authors

- [@ToroData](https://www.github.com/ToroData)

## License

[MIT](https://choosealicense.com/licenses/mit/)
