# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Packages for live system

%packages

# Desktop packages
@^i3-desktop-environment
-i3
-i3-config-fedora
i3-gaps
feh
rofi
pavucontrol
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
system-config-printer
gnome-screenshot
gnome-system-monitor

# Theming
arc-theme
breeze-cursor-theme
papirus-icon-theme

# Used to install aip-man
cargo

# Keyring/password stuff
-gnome-keyring
polkit-kde

# Admin tools are handy to have
@admin-tools
wget
trash-cli
git
zsh

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
-sudo
-gnome-disk-utility

# Rebranding
-fedora-logos
-fedora-release
-fedora-release-notes
generic-release
generic-logos
generic-release-notes

%end
