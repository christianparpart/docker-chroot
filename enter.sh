#! /bin/sh

ROOT=${ROOT:-/chroot}

mount -t proc none ${ROOT}/proc || exit 1
mount -t sysfs none ${ROOT}/sys || exit 1

exec chroot ${ROOT} /bin/bash
