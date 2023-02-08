# Author(s): Dylan Turner
# Description:
# - AIOS Fedora Remix
# - Based on i3 spin

%include fedora-live-base.ks
%include aios-packages.ks

%post

# Fix for mupdf for some reason???
ln -s /usr/lib64/libbz2.so.1.0.8 /usr/lib64/libbz2.so.1.0

# Remix
#sed -i -e 's/Generic release/AppImageOS release/g' /etc/fedora-release /etc/issue
#sed -i -e 's/Generic/Thirty Seven/g' /etc/fedora-release /etc/issue
#cat > /usr/lib/os-release << EOF
#NAME="AOIS"
#VERSION="37"
#ID=aios
#VERSION_ID=37
#PRETTY_NAME="AppImage OS 37"
#ANSI_COLOR="0;34"
#LOGO=generic-logo-icon
#CPE_NAME="cpe:/o:aios:aios:37"
#DEFAULT_HOSTNAME="aios"
#HOME_URL="https://github.com/blueOkiris/aios/"
#SUPPORT_URL="https://github.com/blueOkiris/aios/"
#BUG_REPORT_URL="https://github.com/blueOkiris/aios/"
#REDHAT_BUGZILLA_PRODUCT="AIOS"
#REDHAT_BUGZILLA_PRODUCT_VERSION=37
#REDHAT_SUPPORT_PRODUCT="AIOS"
#REDHAT_SUPPORT_PRODUCT_VERSION=37
#EOF

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

# Theme the final user
systemctl enable aios-theme

# Create /etc/sysconfig/desktop (needed for installation)
cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/i3
DISPLAYMANAGER=/usr/sbin/gdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

# Deactivate xfconf-migration (#683161)
rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop || :

# Set up gdm auto login
cat > /etc/gdm/custom.conf << FOE
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=liveuser
FOE
rm /usr/share/xsessions/gnome.desktop
rm /usr/share/xsessions/gnome-xorg.desktop
rm /usr/share/wayland-sessions/gnome-wayland.desktop
rm /usr/share/wayland-sessions/gnome.desktop

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop

# This goes at the end after all other changes.
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

# Setting the wallpaper
echo "/usr/bin/feh --bg-scale /usr/share/backgrounds/default.png" >> /home/liveuser/.profile

echo "echo 'Type sudo liveinst and hit enter to start the installer.'" >> /home/liveuser/.zshrc

# Fixing the installer non opening bug
echo "xhost si:localuser:root" >> /home/liveuser/.profile

EOF

%end

