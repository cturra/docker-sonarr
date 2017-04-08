FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# setup and install mono (key: D3D831EF) / sonarr (key: FDA5DFFC)
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D3D831EF                                       \
 && echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC                                       \
 && echo "deb http://apt.sonarr.tv/ master main" > /etc/apt/sources.list.d/sonarr.list                      \
 && apt-get -q update            \
 && apt-get -y install mediainfo \
                       nzbdrone  \
 && rm -rf /var/lib/apt/lists/*

# expose sonarr non-ssl and ssl tcp ports
EXPOSE 8989/tcp 9898/tcp

# copy startup script
COPY assets/scripts/startup.sh /opt/startup.sh

# kick off sonarr
ENTRYPOINT [ "/bin/bash", "/opt/startup.sh" ]
