FROM ubuntu:20.04

ENV USER gamer
ENV UID 1000
ENV GID 1000
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install -y sudo software-properties-common curl
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN groupadd --gid $GID $USER
RUN useradd -rm -d /home/$USER -s /bin/bash -g $USER -G sudo -u $UID $USER

# Install wine
RUN curl https://dl.winehq.org/wine-builds/winehq.key > /tmp/winehq.key
RUN apt-key add /tmp/winehq.key
RUN dpkg --add-architecture i386
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
RUN apt update
RUN apt install -y --install-recommends winehq-staging winetricks zenity

# Pre-install Mono, see versions at https://wiki.winehq.org/Mono
RUN mkdir -p /usr/share/wine/mono/
RUN curl http://dl.winehq.org/wine/wine-mono/5.1.1/wine-mono-5.1.1-x86.msi > /usr/share/wine/mono/wine-mono-5.1.1-x86.msi

# Pre-install Gecko, see versions at https://wiki.winehq.org/Gecko
RUN mkdir -p /usr/share/wine/gecko/
RUN curl http://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi > /usr/share/wine/gecko/wine-gecko-2.47.1-x86.msi
RUN curl http://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86_64.msi > /usr/share/wine/gecko/wine-gecko-2.47.1-x86_64.msi
RUN chmod 777 -R /usr/share/wine

RUN curl 'https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe' > /tmp/Battle.net-Setup.exe

COPY start.sh /
CMD /start.sh

USER $USER
