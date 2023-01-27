FROM ubuntu:22.04

ENV   DEBIAN_FRONTEND noninteractive

RUN   apt update \
      && apt install -y --no-install-recommends git wget curl tar zip unzip jq locales lolcat figlet ruby \
         openjdk-8-jdk-headless openjdk-17-jdk-headless openjdk-11-jdk-headless openjdk-8-jdk-headless \
         gcc shc \
      && apt-get clean autoclean \
      && apt-get autoremove --yes \
      && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN wget https://github.com/busyloop/lolcat/archive/master.zip \
    && unzip master.zip \
    && cd lolcat-master/bin \
    && gem install lolcat \
    && cd ../..

## configure locale
RUN   update-locale lang=en_US.UTF-8 \
      &&   dpkg-reconfigure --frontend noninteractive locales
