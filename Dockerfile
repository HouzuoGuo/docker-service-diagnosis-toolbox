FROM ubuntu

MAINTAINER Houzuo Guo <guohouzuo@gmail.com>

WORKDIR /

# Upgrade system packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt upgrade -q -y -f -m -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef

# Install diagnosis utilities
RUN apt install -q -y -f -m -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef bash busybox curl dateutils diffutils dnsutils finger fish gdb hostname htop iftop iotop iputils-ping language-pack-en lftp locales locales-all lsof mailutils moreutils netcat net-tools nmap nmon patchutils procps psmisc rsync screen snmp strace sudo tcpdump tcptraceroute telnet tmux traceroute tree tshark unar unzip util-linux-locales vim wget whois wiggle zip

# Remove unnecessary files
RUN rm -rf /var/cache/apt/*

# Entry point sleeps for an hour, so that the image can be launched as a service.
ENTRYPOINT ["/bin/sh", "-c", "echo container has started, sleeping for 3600 seconds.; sleep 3600"]
