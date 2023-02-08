# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Packages for live system

%packages

# Desktop packages
@i3-desktop-environment
feh
rofi
dex-autostart
xfce4-panel
xfce4-datetime-plugin
xfce4-pulseaudio-plugin
xfce4-fsguard-plugin
xfce4-battery-plugin
git
zsh
zsh-syntax-highlighting
zsh-autosuggestions
coreutils
trash-cli
util-linux-user
sqlite
dbus-daemon
avahi-tools
python3-pip
wget
gdm
-lightdm
-lightdm-gtk
-lightdm-gtk-greeter-settings
@admin-tools

# Keyring/password stuff
gnome-keyring-pam
polkit-kde

# Theming
arc-theme
breeze-cursor-theme
papirus-icon-theme

# Networking
NetworkManager-openconnect-gnome
NetworkManager-openvpn-gnome
NetworkManager-pptp-gnome
NetworkManager-ssh-gnome
network-manager-applet
nm-connection-editor
blueman

# AIOS Specific
aipman
aipster
aios-theme

# User apps. TODO: Make these AppImages
gnome-screenshot
gnome-system-monitor
system-config-printer

# For nvim
python-i3ipc
nodejs
yarnpkg
cargo

# Save some space
-gimp-help
-desktop-backgrounds-basic
-gnome-terminal
-gnome-photos
-gnome-backgrounds
-gnome-icon-theme
-gnome-text-editor
-firefox
-flatpak
-xfce4-terminal

# Rebranding
#-fedora-logos
#-fedora-release
#-fedora-release-notes
#generic-release
#generic-logos
#generic-release-notes

%end
