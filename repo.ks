# Fedora repos
url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch

# Custom AIOS packages
repo --name=aios-pkgs --baseurl=https://dylan-turner.mynetgear.com/aios-pkgs

