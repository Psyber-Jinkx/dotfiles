#!/bin/bash

echo
echo "================================="
echo " Enabling Services"
echo "================================="
echo

read -rp "Enable common services? [Y/n] " answer

if [[ ! "$answer" =~ ^[Nn]$ ]]; then

  sudo systemctl enable NetworkManager

  sudo systemctl enable bluetooth

  echo "✓ NetworkManager"
  echo "✓ bluetooth"

fi

echo

if command -v build-theme >/dev/null 2>&1; then

  read -rp "Run build-theme? [Y/n] " answer

  if [[ ! "$answer" =~ ^[Nn]$ ]]; then

    build-theme

  fi

fi
