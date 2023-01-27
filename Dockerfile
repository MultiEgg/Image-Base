FROM ubuntu:22.04

ENV   DEBIAN_FRONTEND noninteractive

RUN   apt update \
      && apt install -y --no-install-recommends git wget curl tar zip unzip jq locales lolcat figlet ruby \
         openjdk-8-jdk-headless openjdk-17-jdk-headless openjdk-11-jdk-headless openjdk-8-jdk-headless \
         gcc \
      && apt-get clean autoclean \
      && apt-get autoremove --yes \
      && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN wget https://github.com/busyloop/lolcat/archive/master.zip
RUN unzip master.zip
RUN cd lolcat-master/bin
RUN gem install lolcat

RUN cd ../..

RUN git clone https://github.com/neurobin/shc.git
RUN cd shc
RUN git checkout 4.0.3
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

## configure locale
RUN   update-locale lang=en_US.UTF-8 \
      &&   dpkg-reconfigure --frontend noninteractive locales
