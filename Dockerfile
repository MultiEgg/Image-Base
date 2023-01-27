FROM ubuntu:22.04

ENV   DEBIAN_FRONTEND noninteractive

RUN   apt update \
      && apt install -y --no-install-recommends git wget curl tar zip unzip jq lolcat figlet ruby \
         openjdk-8-jdk-headless openjdk-17-jdk-headless openjdk-11-jdk-headless openjdk-8-jdk-headless \
      && apt-get clean autoclean \
      && apt-get autoremove --yes \
      && rm -rf /var/lib/{apt,dpkg,cache,log}/
