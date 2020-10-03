FROM ubuntu:20.04

WORKDIR /

# Upgrade system packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt upgrade -q -y -f -m -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef

# Install diagnosis utilities
RUN apt install -q -y -f -m -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef apache2-utils bash binutils busybox curl dateutils diffutils dnsutils dos2unix findutils finger fish gdb gnutls-bin hostname htop iftop iotop iputils-ping iputils-tracepath language-pack-en less lftp lm-sensors locales lrzsz lsof mailutils minicom miscfiles moreutils mosh netcat net-tools nicstat nmap nmon p7zip patchutils pciutils procps psmisc python3-serial rsync screen snmp socat strace sudo tcpdump tcptraceroute telnet tmux traceroute tree unar uniutils unzip usbutils util-linux util-linux-locales vim wbritish wbritish-huge wget whois wiggle yamllint zip

# Remove unnecessary files
RUN rm -rf /var/cache/apt/*

# Entry point sleeps for an hour, so that the image can be launched as a service.
ENTRYPOINT ["/bin/sh", "-c", "echo container has started, sleeping for 3600 seconds.; sleep 3600"]
