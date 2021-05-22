#!/bin/bash
apt-get update && \
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
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean
