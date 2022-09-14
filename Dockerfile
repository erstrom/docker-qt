FROM ubuntu:22.04

ENV QT_VERSION v6.3.2
ENV QT_CREATOR_VERSION v8.0.1

# Build prerequisites
RUN apt-get -y update && apt-get -y install qtbase5-dev \
	libxcb-xinerama0-dev \
	build-essential \
	python3 \
	cmake

# Other useful tools
RUN apt-get -y update && apt-get -y install tmux \
	wget \
	zip \
	git \
	vim

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
