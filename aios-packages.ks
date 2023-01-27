# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Packages for live system

%packages

# Desktop packages
@i3-desktop-environment
-i3
-i3-config-fedora
i3-gaps
feh
rofi
dex-autostart
xfce4-panel
xfce4-datetime-plugin
xfce4-pulseaudio-plugin
xfce4-fsguard-plugin
xfce4-battery-plugin

# Networking
NetworkManager-openconnect-gnome
NetworkManager-openvpn-gnome
NetworkManager-pptp-gnome
NetworkManager-ssh-gnome
network-manager-applet
nm-connection-editor
blueman

# User apps. TODO: Make these AppImages
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
alacritty
neovim
gnome-screenshot

# Theming
arc-theme
breeze-cursor-theme
papirus-icon-theme

# Used to install aip-man
https://github.com/blueOkiris/aip-man/releases/download/v6/aipman-6.0.0-1.fc37.x86_64.rpm

# Keyring/password stuff
-gnome-keyring
polkit-kde

# Admin tools are handy to have
git
zsh
zsh-syntax-highlighting
zsh-autosuggestions

# For nvim
python-i3ipc
python-neovim
nodejs

# Setup
util-linux-user

# Save some space
-autofs
-acpid
-gimp-help
-desktop-backgrounds-basic
-aspell-*                   # dictionaries are big
-gnome-terminal
-gnome-photos
-gnome-backgrounds
-gnome-icon-theme
-gnome-text-editor
-libwayland
-firefox
-flatpak
-gnome-disk-utility
-gnome-system-monitor
-system-config-printer
-@admin-tools
-@fonts
-@input-methods

# Rebranding
-fedora-logos
-fedora-release
-fedora-release-notes
generic-release
generic-logos
generic-release-notes

%end
