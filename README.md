docker assisted chroot
----------------------

```!sh
URL=http://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-20151001.tar.bz2
TARBALL=/tmp/os-image.tbz2

mkdir -p /chroot
wget -O ${TARBALL} ${URL}
tar xjpf ${TARBALL} -C /chroot

docker run -ti --privileged --hostname gentoo-template -v /chroot:/chroot trapni/chroot
```

### Otherwise:
```
docker run --privileged -ti --rm --name gentoo-template \
           --hostname gentoo-template \
           -v /srv/gentoo-template:/srv/gentoo-template \
           busybox

# inside docker container
mount -t proc none /chroot/proc
mount -t sysfs none /chroot/sys
exec chroot /chroot /bin/bash

# inside chroot
/usr/sbin/env-update
source /etc/profile

# ...
```
