FROM ubuntu

MAINTAINER Houzuo Guo <guohouzuo@gmail.com>

ARG http_proxy
ARG https_proxy
ARG socks_proxy
ARG all_proxy

ENV http_proxy=$http_proxy
ENV https_proxy=$https_proxy
ENV socks_proxy=$socks_proxy
ENV all_proxy=$all_proxy

WORKDIR /

# Upgrade system packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt upgrade -q -y -f -m -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef

# Install diagnosis utilities
RUN apt install -q -y -f -m -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef apache2-utils bash binutils busybox curl dateutils diffutils dnsutils dos2unix findutils finger fish gnutls-bin hostname htop iftop iotop iputils-ping iputils-tracepath language-pack-en less lftp lm-sensors locales lrzsz lsof mailutils minicom miscfiles moreutils mosh netcat net-tools nicstat nmap nmon p7zip patchutils pciutils procps psmisc python3-serial rsync screen snmp socat strace sudo tcpdump tcptraceroute telnet tmux traceroute tree unar uniutils unzip usbutils util-linux util-linux-locales vim wbritish wbritish-huge wget whois wiggle yamllint zip

# Remove unnecessary files
RUN rm -rf /var/cache/apt/*

# Entry point sleeps for an hour, so that the image can be launched as a service.
ENTRYPOINT ["/bin/sh", "-c", "echo container has started, sleeping for 3600 seconds.; sleep 3600"]
