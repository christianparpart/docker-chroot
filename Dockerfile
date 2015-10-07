FROM busybox

ENV ROOT /chroot

ADD enter.sh enter

RUN /enter
