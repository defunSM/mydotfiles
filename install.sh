#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Install paru

function install_paru {
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
}

function install_dependencies {
    paru -S base-devel emacs ly alacritty bspwm picom polybar sxhkd python-pynvim stow zsh chromium qemu ebtables dnsmasq bridge-utils virt-manager libvirt vi man htop bashtop xrandr arandr lxappearance
    sudo pacman -S xorg xorg-xinit xterm
    sudo systemctl enable gdm
    echo 'export XDG_SESSION_TYPE=x11\nexport GDK_BACKEND=x11\nexec gnome-session' >> /home/$USER/.xinitrc
}

function install_utility_programs {
    paru -S xrandr arandr redshift nitrogen xsetroot nm-applet blueman-applet corectrl pasystray picom
}

function setup_doom_emacs {
    git clone --depth 1 https://github.com/hlissner/doom-emacs /home/$USER/.emacs.d
    /home/$USER/.emacs.d/bin/doom install
}

function setup_oh_my_zsh {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    paru -S zsh-fast-syntax-highlighting
    git clone https://github.com/denysdovhan/spaceship-prompt.git "/home/$USER/.oh-my-zsh/themes/spaceship-prompt" --depth=1
    ln -s "/home/$USER/.oh-my-zs/themes/spaceship-prompt/spaceship.zsh-theme" "/home/$USER/.oh-my-zs/themes/spaceship.zsh-theme" 
}

function setup_development_env {
    paru -S vagrant
    vagrant plugin install vagrant-vbguest vagrant-libvirt
    sudo systemctl start libvirtd
    sudo systemctl enable libvirtd
}

function setup_dotfiles {
    cd /home/$USER/dotfiles/dotfiles
    stow -v --dotfiles --target=$HOME bspwm sxhkd picom Xresources
}

install_paru
install_dependencies
install_utility_programs
setup_doom_emacs
setup_oh_my_zsh
setup_development_env
setup_dotfiles
