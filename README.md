# Archbook Dotfiles

Personal Arch Linux + Hyprland configuration.

## Features

- Hyprland
- Waybar
- Alacritty
- Rofi
- SwayNC
- Dunst
- Neovim
- Zsh + Oh My Zsh
- Atuin
- Cliphist clipboard history
- Kanshi monitor profiles
- Dynamic theme generation

---

## Screenshots

Add screenshots here.

---

## Directory Layout

```text
.
├── alacritty
├── dunst
├── hypr
├── kanshi
├── nvim
├── rofi
├── swaync
├── waybar
├── zsh
├── themes
├── templates
├── generated
└── scripts
```

---

## Requirements

### Core Packages

```bash
sudo pacman -S \
    hyprland \
    waybar \
    rofi-wayland \
    alacritty \
    dunst \
    swaync \
    kanshi \
    zsh \
    atuin \
    cliphist \
    wl-clipboard \
    zoxide \
    eza \
    fzf \
    neovim \
    git
```

### Optional Packages

```bash
sudo pacman -S \
    fastfetch \
    gammastep \
    flameshot \
    qt6ct \
    htop
```

---

## Dotfile Management

The following configuration directories are symlinked from this repository:

```text
~/.config/hypr      -> ~/.dotfiles/hypr
~/.config/waybar    -> ~/.dotfiles/waybar
~/.config/alacritty -> ~/.dotfiles/alacritty
~/.config/zsh       -> ~/.dotfiles/zsh
~/.config/kanshi    -> ~/.dotfiles/kanshi
~/.config/rofi      -> ~/.dotfiles/rofi
~/.config/swaync    -> ~/.dotfiles/swaync
~/.config/dunst     -> ~/.dotfiles/dunst
~/.config/nvim      -> ~/.dotfiles/nvim
```

---

## Themes

Themes are generated from templates and theme definitions.

Theme sources:

```text
themes/
templates/
```

Generated output:

```text
generated/
```

Current supported themes:

- Catppuccin
- Gruvbox
- Kripton
- Neon
- Neon Blue
- Neon Green
- Neon Red
- Nord
- Tokyo Night

---

## Monitor Configuration

Monitor profiles are managed using Kanshi.

Configuration:

```text
~/.config/kanshi/config
```

Profiles:

### Work

```text
DP-2
+
eDP-1
```

### Home

```text
HDMI-A-1
+
eDP-1
```

### Laptop

```text
eDP-1 only
```

Kanshi automatically switches profiles when monitors are connected or disconnected.

---

## Workspace Assignment

Workspace assignment is handled independently from monitor layout.

Script:

```text
~/.local/bin/get-external-monitor
```

Configuration:

```text
hypr/config/rules.lua
```

---

## Clipboard History

Clipboard history uses:

```text
cliphist
rofi
wl-clipboard
```

Open clipboard history:

```text
SUPER + V
```

---

## Zsh

Plugins:

```text
git
archlinux
zsh-autosuggestions
zsh-syntax-highlighting
zsh-shift-select
```

Additional tools:

```text
atuin
zoxide
fzf
```

---

## GitHub

Repository uses SSH authentication.

Verify:

```bash
ssh -T git@github.com
```

Expected output:

```text
Hi Psyber-Jinkx! You've successfully authenticated...
```

---

## Backups

Local backups are stored in:

```text
~/.backups
```

GitHub serves as the primary off-machine backup.

---

## Useful Commands

### Update Dotfiles

```bash
cd ~/.dotfiles

git status
git add .
git commit -m "Update configuration"
git push
```

### Reload Hyprland

```bash
hyprctl reload
```

### Reload Waybar

```bash
pkill waybar && waybar &
```

### Check Kanshi

```bash
pgrep -a kanshi
```

### Check Monitor State

```bash
hyprctl monitors
```

### Search Command History

```text
Ctrl + R
```

Powered by Atuin.

---

## TODO

- Create install.sh bootstrap script
- Add screenshots
- Add package installation automation
- Consider GNU Stow migration
