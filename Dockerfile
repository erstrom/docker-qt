FROM ubuntu:16.04

ENV QT_VERSION v5.9.1
ENV QT_CREATOR_VERSION v4.3.1

RUN apt-get -y update
RUN apt-get -y upgrade

# Build prerequisites
RUN apt-get -y install qt5-default make g++ python
RUN apt-get -y install libxcb-xinerama0-dev

# Other useful tools
RUN apt-get -y install tmux wget zip git vim

# Simple root password in case we want to customize the container
RUN echo "root:root" | chpasswd

RUN useradd -G video -ms /bin/bash user

RUN mkdir -p /qt/build

WORKDIR /qt/build

ADD build_qt.sh /qt/build/build_qt.sh
RUN QT_VERSION=$QT_VERSION QT_CREATOR_VERSION=$QT_CREATOR_VERSION /qt/build/build_qt.sh

USER user

WORKDIR /qt

CMD ["bash"]
