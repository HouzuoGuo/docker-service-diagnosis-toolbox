FROM alpine

MAINTAINER Houzuo Guo <guohouzuo@gmail.com>

WORKDIR /

# Upgrade system packages
RUN apk update && apk upgrade --update-cache --available

# Install diagnosis utilities
RUN apk add bash bind-tools busybox busybox-extras curl dateutils fish htop iftop iotop iputils lftp lsof mailx net-tools nmap procps psmisc rsync screen strace sudo tcpdump tcptraceroute tmux tree unzip vim wget whois zip

# Remove unnecessary files
RUN rm -rf /var/cache/apk/*

# Entry point sleeps for an hour, so that the image can be launched as a service.
ENTRYPOINT ["/bin/sh", "-c", "echo container has started, sleeping for 3600 seconds.; sleep 3600"]
