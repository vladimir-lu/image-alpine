## -*- docker-image-name: "scaleway/alpine:latest" -*-
FROM multiarch/alpine:x86_64-v3.6
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM multiarch/alpine:armhf-v3.6   # arch=armv7l
#FROM multiarch/alpine:x86-v3.6    # arch=i386

# Environment
ENV SCW_BASE_IMAGE scaleway/alpine:latest


# Adding and calling builder-enter
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/
RUN /bin/sh -e /usr/local/sbin/scw-builder-enter


# Install packages
RUN apk update \
 && apk upgrade \
 && apk add \
    alpine-base \
    bash \
    busybox-suid \
    curl \
    cryptsetup \
    dnsmasq \
    e2fsprogs \
    eudev \
    iptables \
    ip6tables \
    iproute2 \
    iputils \
    libressl \
    openssh \
    openntpd \
    pciutils \
    sudo \
    tor \
    tar \
    wget \
 && rm -rf /var/cache/apk/*


# Patch rootfs
COPY ./overlay/ ./overlay-image-tools/ /


# Configure autostart packages
RUN rc-update add sshd default\
 && rc-update add scw-ssh-keys default \
 && rc-update add ntpd default \
 && rc-update add hostname default \
 && rc-update add update-motd default \
 && rc-update add sysctl default \
 && rc-update add scw-sync-kernel-extra default \
 && rc-update add scw-initramfs-shutdown shutdown \
 && rc-status


# Update permissions
RUN chmod 700 /root


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
