FROM ubuntu:16.04

ENV QT_VERSION v5.9.1
ENV QT_CREATOR_VERSION v4.3.1

RUN apt-get -y upgrade
RUN apt-get -y update

# Build prerequisites
RUN apt-get -y build-dep qt5-default
RUN apt-get -y install libxcb-xinerama0-dev

# Other useful tools
RUN apt-get -y install tmux wget zip git vim

RUN mkdir -p /qt/build

WORKDIR /qt/build

ADD build_qt.sh /qt/build/build_qt.sh
RUN QT_VERSION=$QT_VERSION QT_CREATOR_VERSION=$QT_CREATOR_VERSION /qt/build/build_qt.sh

WORKDIR /qt

CMD ["bash"]
