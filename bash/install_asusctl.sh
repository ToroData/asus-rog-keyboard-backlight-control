#!/bin/bash

set -e

echo "Updating package index..."
sudo apt update

echo "Installing required system dependencies..."
sudo apt install -y build-essential cmake git \
  libudev-dev libdbus-1-dev libevdev-dev \
  libglib2.0-dev libsystemd-dev

echo "Cloning asusctl repository..."
git clone https://gitlab.com/asus-linux/asusctl.git
cd asusctl

echo "Attempting to install Cargo (Rust toolchain)..."
if ! command -v cargo &> /dev/null; then
    sudo apt install -y cargo || {
        echo "Cargo installation via apt failed. Installing via rustup..."
        sudo apt install -y curl
        curl https://sh.rustup.rs -sSf | sh -s -- -y
        source "$HOME/.cargo/env"
    }
else
    echo "Cargo is already installed."
fi

echo "Attempting to build asusctl..."
if ! cargo build --release; then
    echo "Initial build failed. Installing additional dependencies and retrying..."
    sudo apt install -y linux-headers-$(uname -r) \
        libclang-dev clang pkg-config

    echo "Retrying build after cleaning..."
    cargo clean
    source "$HOME/.cargo/env"
    cargo build --release
fi


echo "Installation completed successfully."
echo "You may now run the setup_keyboard_shortcuts.sh script to configure key bindings."
