FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

# prep/config mono and sonarr
RUN apt-get -q update      \
 && apt-get -y --no-install-recommends install dirmngr   \
                                               gpg       \
                                               gpg-agent

# fetch/install/setup for mono (key: D3D831EF) / sonarr (key: FDA5DFFC)
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF            \
 && echo "deb http://download.mono-project.com/repo/debian stable-bionic main" > /etc/apt/sources.list.d/mono.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493            \
 && echo "deb http://apt.sonarr.tv/ master main" > /etc/apt/sources.list.d/sonarr.list

# install mono and sonarr
RUN apt-get -q update                                    \
 && apt-get -y --no-install-recommends install mediainfo \
                                               nzbdrone

# clean up after apt
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose sonarr non-ssl and ssl tcp ports
EXPOSE 8989/tcp 9898/tcp

# copy startup script
COPY assets/scripts/startup.sh /opt/startup.sh

# kick off sonarr
ENTRYPOINT [ "/bin/bash", "/opt/startup.sh" ]
