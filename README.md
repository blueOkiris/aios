# AppImageOS (AIOS)

NOTE: This project is not even CLOSE to being ready. Use at your own risk. I'll remove this after a real release

## Description

The AppImageOS - Use your computer. Don't maintain it.

AppImageOS (or AIOS /'eɪ.ɑs/) is a Linux OS built on top of Fedora (unofficially, of course) with the goal of living only in userland. If you want to play games, play games. If you want to browse the web, browse the web. If you want to use your computer, you should be able to do it, and you shouldn't need to maintain a system to enjoy the benefits of FOSS.

AIOS uses AppImages and custom AppImage package manager to install software, and leaves the system to be stable.

On top of that, we strive to bring you a customized desktop environment built around the wonderful i3 window manager with nice theming out-of-the-box.

## Building the Live ISO

You will need `Fedora`, `lorax`, and `pykickstart`

Probably want to build in a VM or container (so you don't accidentally write over your own system or something), but I didn't, so...

Run

```
sudo ksflatten -c aios-live.ks -o flatten.ks \
    && sudo livemedia-creator --make-iso --ks flatten.ks \
        --iso-only --no-virt \
        --iso-name AppImageOS-37-x86_64.iso --releasever 37 --fs-label AppImage-OS-37 \
        --tmp tmp --resultdir result
```

to build it, and then

```
sudo cp result/AppImageOS-37-x86_64.iso . && sudo chown $USER:$USER AppImageOS-37-x86_64.iso
```

to copy it to the current dir and allow you to run it.

