FROM ubuntu:18.10
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y wget gnupg software-properties-common
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
RUN apt update
RUN apt install -y wine-staging
RUN mkdir -p /root/.wine/drive_c/
RUN wget 'https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe' -O /root/.wine/drive_c/Battle.net-Setup.exe
COPY start.sh /
ENTRYPOINT /start.sh
