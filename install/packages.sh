#!/bin/bash

echo
echo "====================="
echo " Installing Packages "
echo "====================="
echo

read -rp "Install pacman packages? [Y/n] " answer

if [[ ! "$answer" =~ ^[Nn]$ ]]; then

  sudo pacman -S --needed - \
    <"$HOME/.dotfiles/package-list.txt"

fi

if command -v yay >/dev/null 2>&1; then
  echo

  read -rp "Install AUR packages? [Y/n] " answer

  if [[ ! "$answer" =~ ^[Nn]$ ]]; then

    yay -S --needed \ 
    $(cat "$HOME/.dotfiles/aur-package-list.txt")
  fi

else

  echo
  echo "yay not found."
  echo "Skipping AUR packages."

fi
