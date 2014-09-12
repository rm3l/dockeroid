# Version 1.0

FROM ubuntu:12.04

MAINTAINER rm3l <armel@rm3l.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get --yes --force-yes install aptitude
RUN aptitude install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  openjdk-7-jdk
RUN aptitude install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386
RUN aptitude install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  pngquant pngtools pngnq pngcrush

RUN ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

RUN useradd --create-home r2d2

RUN mkdir -p /home/r2d2/{bin,roms}

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /home/r2d2/bin/repo
RUN chmod a+x /home/r2d2/bin/repo

WORKDIR /home/r2d2/roms

RUN echo "PATH=/home/r2d2/bin:$PATH" >> /etc/bash.bashrc
RUN echo "USE_CCACHE=1" /etc/bash.bashrc
