# AppImageOS (AIOS)

NOTE: This project is not even CLOSE to being ready. Use at your own risk. I'll remove this after a real release

## Description

The AppImageOS - Use your computer. Don't maintain it.

AppImageOS (or AIOS /'eɪ.ɑs/) is a Linux OS built on top of Fedora (unofficially, of course) with the goal of living only in userland. If you want to play games, play games. If you want to browse the web, browse the web. If you want to use your computer, you should be able to do it, and you shouldn't need to maintain a system to enjoy the benefits of FOSS.

AIOS uses AppImages and custom AppImage package manager to install software, and leaves the system to be stable.

On top of that, we strive to bring you a customized desktop environment built around the wonderful i3 window manager with nice theming out-of-the-box.

## Building the Live ISO

You will need `Fedora`, `lorax`, and `pykickstart` as well as `httpd` and `createrepo`

### Setting up the AIOS package repo

In order to run the installer, it has to be able to pull from a custom AIOS package repo, so you need to host a server to do it. It's not that hard I promise. Just follow along.

After installing httpd, you need to allow http ports in the firewall. You can do this temporarily, but as long as you aren't port forwarding, you should be safe. Disable the firewall for http like so: `sudo firewall-cmd --permanent --add-port=80/tcp`

Then you need to clone the aios-pkgs. Do it somewhere temporary like your downloads folder. We're going to move it and set permissions after is why.

Git clone and move the repo:

```
cd Downloads
git clone https://github.com/blueOkiris/aios-pkgs
sudo chown -R apache:apache aios-pkgs
sudo mv aios-pkgs /var/www/html
```

Okay then do `ls -la --context /var/www/html`

You'll see something like `system_u:object_r:httpd_sys_content_t:s0` for `.` (i.e. /var/www/html). That's the security permissions for /var/www/html. We need to set aios-pkgs to be the same security permissions.

We do that like so: `sudo chcon -R system_u:object_r:httpd_sys_content_t:s0 /var/www/html/aios-pkgs` (NOTE: change `system_u:object_r:httpd_sys_content_t:s0` to whatever yours said)

Check that it's all working by navigating to http://localhost/aios-pkgs in your web browser.

Finally, we need to download the actual rpms to the repo.

Do this via:

```
cd /var/www/html/aios-pkgs
sudo -u apache wget https://github.com/blueOkiris/aios-pkgs/releases/download/vInfinite/aios-default-appimages-1.0.0-12.fc37.x86_64.rpm
sudo -u apache wget https://github.com/blueOkiris/aios-pkgs/releases/download/vInfinite/aios-themer-1.0.0-22.fc37.x86_64.rpm
sudo -u apache wget https://github.com/blueOkiris/aios-pkgs/releases/download/vInfinite/aipman-6.0.0-1.fc37.x86_64.rpm
sudo -u https://github.com/blueOkiris/aios-pkgs/releases/download/vInfinite/aipster-2.0.0-1.fc37.x86_64.rpm
```

Finally, we need to make sure the repo is correct, so run `sudo -u apache createrepo --update .`

### Building the ISO

First clone the repo: `git clone https://github.com/blueOkiris/aios && cd aios`

Run

```
sudo ksflatten -c aios-live.ks -o flatten.ks \
    && sudo rm -rf result \
    && sudo livemedia-creator --make-iso --ks flatten.ks \
        --iso-only --no-virt --image-size 8192 \
        --iso-name AppImageOS-37-x86_64.iso --releasever 37 --fs-label AppImage-OS-37 \
        --tmp tmp --resultdir result
```

to build it, and then

```
sudo cp result/AppImageOS-37-x86_64.iso . && sudo chown $USER:$USER AppImageOS-37-x86_64.iso
```

to copy it to the current dir and allow you to run it from a VM.

