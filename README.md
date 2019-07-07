# docker-service-diagnosis-toolbox

Build a Docker image based on Ubuntu Linux with extra utilities for system and network diagnosis, such as curl, lftp, telnet, nmap, wget, and many more.

Ready-to-use images are available from: https://hub.docker.com/r/hzgl/service-diagnosis-toolbox

This image is nearly identical to https://github.com/HouzuoGuo/docker-diagnosis-toolbox, except that the entry point of this image sleeps for 3600 seconds (suitable as a docker service), instead of launching fish shell.

See https://github.com/HouzuoGuo/docker-service-diagnosis-toolbox for more details.

This image is prepared for 64-bit x86 processor architecture.
