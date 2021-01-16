#!/usr/bin/env bash
set -euo pipefail

gconfig add .vim .config/picom .config/bspwm .config/sxhkd .xinitrc .zprofile .zshrc .config/alacritty .doom.d .config/kitty/kitty.conf .config/polybar .config/xmobar .config/qtile .config/starship.toml .config/ranger add-and-commit-dotfiles.sh install.sh
gconfig commit -m "updating dotfiles"
gconfig push
