#!/bin/bash

echo
echo "================================="
echo " Creating Symlinks"
echo "================================="
echo

DOTFILES="$HOME/.dotfiles"

configs=(
  alacritty
  atuin
  dunst
  flameshot
  gammastep
  gtk-2.0
  gtk-3.0
  gtk-4.0
  htop
  hypr
  kanshi
  nvim
  qt6ct
  rofi
  swaync
  themesw
  waybar
  xsettingsd
  zsh
)

for config in "${configs[@]}"; do

  if [ -e "$DOTFILES/$config" ]; then

    ln -sfn \
      "$DOTFILES/$config" \
      "$HOME/.config/$config"

    echo "✓ $config"
  fi

done

echo
echo "Linking scripts..."
echo

for script in "$DOTFILES/scripts/"*; do

  [ -f "$script" ] || continue

  ln -sfn \
    "$script" \
    "$HOME/.local/bin/$(basename "$script")"

  echo "✓ $(basename "$script")"

done

echo
echo "Done."
