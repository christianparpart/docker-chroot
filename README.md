docker assisted chroot
----------------------

```!sh
URL=http://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-20151001.tar.bz2
TARBALL=/tmp/os-image.tbz2

mkdir -p /chroot
wget -O ${TARBALL} ${URL}
tar xjpf ${TARBALL} -C /chroot

docker run -ti --rm --hostname gentoo-template -v /chroot:/chroot trapni/chroot
```
