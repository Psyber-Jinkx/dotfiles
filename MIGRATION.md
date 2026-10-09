# Linux Migration Guide 

This document describes how to rebuild my Linux environment on a new machine.

Current Environment:

- Arch Linux
- Hyprland
- Waybar
- Kanshi
- Neovim (LazyVim)
- Zsh 
- Atuin 
- Rofi 

--- 

# Order of Operations 

1. Install Arch Linux
2. Install Git and OpenSSH  
3. Configure GitHub SSH authentication   
4. Clone dotfiles repository 
5. Create configured symlinks 
6. Install required packages 
7. Configure networking
8. Configure audio 
9. Verify desktop environment 
10. Restore accounts and services 
11. Verify migration checklist

--- 

# Initial System Setup 

Update system:

```bash
sudo pacman -Syu
```
 
Install basic tools:
 
```bash
sudo pacman -S git openssh curl wget
```
 
Install AUR helper if required.

--- 

# GitHub Setup 

Generate SSH key:

```bash
ssh-keygen -t ed25519 
```

Start SSH Agent:

```bash
eval "$(ssh-agent -s)"
```

Add SSH Key:

```bash
ssh-add ~/.ssh/id_ed25519 
```

Display public key:

```bash
cat ~/.ssh/id_ed25519.pub 
```

Add the public key to Github.

Test Connectivity:

```bash
ssh -T git@github.com 
```

Expected Result:

```Test
You've successfully authenticated
```

--- 

# Clone Dotfiles

Clone repository:

```bash
git clone git@github.com:YOUR-GITHUB-USERNAME/dotfiles.git ~/.dotfiles
```

Verify:

```bash
ls ~/.dotfiles 
```

---

# Configuration symlinks

Create required symlinks.

Example:

```bash
ln -s ~/.dotfiles/hypr ~/.config/hypr 
```

Required Links:

```text
~/.config/hypr 
~/.config/waybar 
~/.config/kanshi 
~/.config/nvim 
~/.config/zsh 
~/.config/atuin 
```

Verify:

```bash
ls -l ~/.config
```

--- 

# Package Installation 

If available:

```bash
sudo pacman -S --needed - < ~/.dotfiles/package-list.txt 
```

--- 

# Required Applications

## Desktop

- hyprland 
- waybar 
- rofi 
- kanshi 
- swaync 
- dunst 

## Shell 

- zsh 
- atuin 
- zoxide 
- fastfetch

## Editor 

- neovim 

## Networking 

- networkmanager (not correct need to change)

## Audio 

- pipewire
- wireplumber
- pipewire-pulse
- pavucontrol
- playerctl

## Bluetooth

- bluez 
- bluez-utils
- blueman

## Clipboard

- cliphist 
- wl-clipboard 

## Git 

- git 
- openssh 
- lazygit 

--- 

# Networking 

Verify NetworkManager:

```bash
systemctl status NetworkManager 
```

Configure wireless networks:

```bash
nmtui
```

Tasks:

- Add WiFi
- Configure School Network 
- Configure Home Network 
- Test Connectivity 

Verify:

```bash
ping archlinux.org 
```

--- 

# Audio 

Verify audio services:

- Speakers 
- Headphones 
- Bluetooth audio 
- Microphone 

Useful Commands:

```bash
wpctl status 
```

# Bluetooth 

Enable Bluetooth:

```bash
sudo systemctl enable bluetooth 
sudo systemctl start bluetooth 
```

Launch Manager:

```bash
blueman-manager
```

Verify:

- Headphones connect 
- Audio output works 
- Auto reconnect works 

# Hyprland 

Verify: 

```bash
Hyprland
```

Check Monitor Detection:

```bash
hyprctl monitors
```

Reload Configuration:

```bash
hyprctl reload 
```

--- 

# Monitor Configuration 

Configuration file:

```text
~/.config/kanshi/config
```

Profiles:

### Laptop

```text
eDP-1 only
```

### Work

```text
eDP-1 + DP-2
```

### Home

```text
eDP-1 + HDMI-A-1
```

Verify:

```bash
kanshi
```

Useful command:

```bash
hyprctl monitors
```

---

# Waybar

Restart:

```bash
pkill waybar
waybar &
```

Verify:

- Workspaces display correctly
- Audio module works
- Network module works
- Battery module works
- Custom themes load

---

# Notifications

Verify SwayNC:

```bash
swaync
```

Send test notification:

```bash
notify-send "Test" "Notifications Working"
```

---

# Neovim

Open:

```bash
nvim
```

Verify:

```vim
:Lazy
```

Verify:

```vim
:Mason
```

Verify:

```text
Space Space
```

opens file finder.

Configuration location:

```text
~/.config/nvim
```

---

# Atuin

Configuration:

```text
~/.config/atuin/config.toml
```

Login:

```bash
atuin login
```

Sync:

```bash
atuin sync
```

Verify:

```bash
atuin stats
```

---

# Git Configuration

Configure identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Verify:

```bash
git config --global --list
```

---

# Custom Scripts

Verify required scripts exist:

```text
build-theme
clipboard-menu
get-external-monitor
```

Check script directory:

```bash
ls ~/.dotfiles/scripts
```

Test:

```bash
build-theme
```

Test:

```bash
clipboard-menu
```

---

# Theme System

Verify:

```bash
build-theme
```

Reload:

```bash
hyprctl reload
```

Check:

- Waybar theme
- Hyprland theme
- Notification colors

---

# Password Manager

Install Bitwarden.

Devices:

- Linux Laptop
- Windows Desktop
- Pixel Phone

Enable:

- Sync
- Autofill
- MFA through Microsoft Authenticator

Important accounts:

- GitHub
- Microsoft
- Google

---

# Migration Verification

Run through the following checklist:

- [ ] Arch installed
- [ ] Git installed
- [ ] SSH key generated
- [ ] GitHub authentication working
- [ ] Dotfiles cloned
- [ ] Symlinks created
- [ ] Required packages installed
- [ ] NetworkManager working
- [ ] WiFi configured
- [ ] PipeWire working
- [ ] Bluetooth working
- [ ] Hyprland working
- [ ] Waybar working
- [ ] Notifications working
- [ ] Kanshi working
- [ ] Monitor profiles working
- [ ] Neovim configured
- [ ] Atuin synced
- [ ] Git configured
- [ ] Scripts present
- [ ] Theme system working
- [ ] Bitwarden configured

---

# Migration Complete

The migration is complete when:

- GitHub access works
- Dotfiles are synced
- Monitors work correctly
- Audio works correctly
- Bluetooth works correctly
- Atuin works
- Neovim works
- Themes work
- Daily workflow matches previous machine
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```
```


```
```


```
```
