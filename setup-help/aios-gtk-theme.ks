# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Create the GTK rc files

%post

mkdir -p /home/liveuser/
cat > .gtkrc-2.0 << EOF
gtk-theme-name="Arc-Dark"
gtk-icon-theme-name="Papirus-Dark"
gtk-cursor-theme-name="breeze_cursors"
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintmedium"
EOF

mkdir -p /home/liveuser/.config/gtk-3.0
cat > /home/liveuser/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=0
gtk-button-images=1
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
gtk-decoration-layout=icon:minimize,maximize,close
gtk-enable-animations=true
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-font-name=Ubuntu,  10
gtk-icon-theme-name=Papirus-Dark
gtk-menu-images=1
gtk-primary-button-warps-slider=false
gtk-theme-name=Arc-Dark
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintmedium
EOF

mkdir -p /home/liveuser/.config/gtk-4.0
cat > /home/liveuser/.config/gtk-4.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=0
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
gtk-decoration-layout=icon:minimize,maximize,close
gtk-enable-animations=true
gtk-icon-theme-name=Papirus-Dark
gtk-primary-button-warps-slider=false
gtk-theme-name=Arc-Dark
EOF

%end
