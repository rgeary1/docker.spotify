FROM ubuntu:18.04

ARG BUILD_DATE=2019.02.11
ARG USER
ARG UID

RUN apt-get -y update
RUN apt-get -y install gnupg2
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
RUN echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
RUN apt-get -y update
RUN apt-get -y install spotify-client ffmpeg
RUN apt-get -y install x11-apps alsamixergui alsa-tools

RUN groupadd audio2 -g 63 && groupadd $USER -g ${UID} && useradd -u ${UID} -g ${USER} -G audio2 ${USER}
RUN mkdir -p /home/${USER}/ && chown -R ${USER}:${USER} /home/${USER}/

COPY .asoundrc /home/${USER}/
VOLUME /home/${USER}

USER ${USER}

ENTRYPOINT /usr/bin/spotify

