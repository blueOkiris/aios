# Author(s): Dylan Turner
# Description:
# - AIOS Fedora Remix
# - Based on i3 spin

%include fedora-live-base.ks
%include fedora-live-minimization.ks
%include aios-packages.ks

%post

# Remix
sed -i -e 's/Generic release/AppImageOS release/g' /etc/fedora-release /etc/issue
sed -i -e 's/Generic/Thirty Seven/g' /etc/fedora-release /etc/issue
cat > /usr/lib/os-release << EOF
NAME="AOIS"
VERSION="37"
ID=aios
VERSION_ID=37
PRETTY_NAME="AppImage OS 37"
ANSI_COLOR="0;34"
LOGO=generic-logo-icon
CPE_NAME="cpe:/o:aios:aios:37"
DEFAULT_HOSTNAME="aios"
HOME_URL="https://github.com/blueOkiris/aios/"
SUPPORT_URL="https://github.com/blueOkiris/aios/"
BUG_REPORT_URL="https://github.com/blueOkiris/aios/"
REDHAT_BUGZILLA_PRODUCT="AIOS"
REDHAT_BUGZILLA_PRODUCT_VERSION=37
REDHAT_SUPPORT_PRODUCT="AIOS"
REDHAT_SUPPORT_PRODUCT_VERSION=37
EOF

# Fix avahi daemon
adduser --system --shell /bin/false --home /var/run/avahi avahi
sed -i -e 's/#disallow-other-stacks=no/disallow-other-stacks=yes/g' /etc/avahi/avahi-daemon.conf

# Ensure polkit is set up properly
getent group polkitd >/dev/null \
    && echo -e "\e[1;32mpolkitd group already exists\e[0m" \
    || { \
        groupadd -r polkitd \
            && echo -e "\e[1;33mAdded missing polkitd group\e[0m" \
            || echo -e "\e[1;31mAdding polkitd group FAILED\e[0m"; \
    }
getent passwd polkitd >/dev/null \
    && echo -e "\e[1;32mpolkitd user already exists\e[0m" \
    || { \
        useradd -r -g polkitd -d / -s /sbin/nologin -c "User for polkitd" polkitd \
        && echo -e "\e[1;33mAdded missing polkitd user\e[0m" \
        || echo -e "\e[1;31mAdding polkitd user FAILED\e[0m"; \
    }

# Fix internet
systemctl enable systemd-resolved

# Create /etc/sysconfig/desktop (needed for installation)
cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/i3
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

# Deactivate xfconf-migration (#683161)
rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop || :

# Set up lightdm autologin
sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# Set i3 as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=i3/' /etc/lightdm/lightdm.conf

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop

# This goes at the end after all other changes.
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

# Setting the wallpaper
echo "/usr/bin/feh --bg-scale /usr/share/backgrounds/default.png" >> /home/liveuser/.profile

# Echoing type liveinst to start the installer
echo "echo 'Please type liveinst and press Enter to start the installer'" >> /home/liveuser/.zshrc

# Fixing the installer non opening bug
echo "xhost si:localuser:root" >> /home/liveuser/.profile

EOF

%end


