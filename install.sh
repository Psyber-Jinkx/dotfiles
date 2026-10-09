#!/bin/bash

set -e

echo
echo "========================="
echo " Jinkx's Linux Installer"
echo "========================="
echo
echo "[1] Create Directories"
echo "[2] Create Symlinks"
echo "[3] Install Pacman Packages"
echo "[4] Install AUR Packages"
echo "[5] Enable Services"
echo "[6] Build Theme"
echo

read -rp "Proceed? [Y/n] " answer

if [[ "$answer" =~ ^[Nn]$ ]]; then
  echo "Cancelled."
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SCRIPT_DIR/install" ]; then
  * echo "Install directory not found*"
  exit 1
fi

echo

source "$SCRIPT_DIR/install/directories.sh"
source "$SCRIPT_DIR/install/links.sh"
source "$SCRIPT_DIR/install/packages.sh"
source "$SCRIPT_DIR/install/services.sh"
source "$SCRIPT_DIR/install/summary.sh"
