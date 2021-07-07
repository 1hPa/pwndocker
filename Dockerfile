FROM ubuntu:20.04

RUN dpkg --add-architecture i386

RUN apt-get update && \
apt-get install -y --no-install-recommends \
libc6-dbg \
libc6-dbg:i386 \
gcc-multilib \
locales \
curl \
wget \
python3-dev \
python3-pip \
ruby \
ruby-dev \
gdb \
vim \
file \
patchelf \
make \
git \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean

RUN locale-gen en_US.UTF-8

ENV LANG en_US.utf8

RUN python3 -m pip install --upgrade pip \
&& python3 -m pip install setuptools \
&& pip3 install \
pwntools \
capstone \
ropgadget \
ropper

RUN gem install one_gadget
RUN mkdir -p $HOME/gef \
    && cd $HOME/gef
RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

RUN echo 'export PS1="[\[\e[34m\]\u\[\e[0m\]@\[\e[33m\]\H\[\e[0m\]:\w]\$"' >> /root/.bashrc

RUN mkdir -p /ctf/yu1hpa
WORKDIR /ctf/yu1hpa

