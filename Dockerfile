FROM ubuntu:20.04

RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libc6-dbg \
    libc6-dbg:i386 \
    gcc-multilib \
    curl \
    python3-dev \
    python3-pip \
    ruby \
    ruby-dev \
    gdb \
    vim \
    file \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# pwntools
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install setuptools \
    && pip3 install \
    pwntools \
    capstone \
    ropgadget \
    ropper \

RUN gem install one_gadget

# gef
RUN pip3 install keystone-engine \
    && mkdir -p $HOME/gef \
    && cd $HOME/gef \
    && curl -L https://github.com/hugsy/gef/raw/master/gef.py > gef.py \
    && echo "source $HOME/gef/gef.py" > gdbgef \
    && echo "alias gdb='gdb -q'" >> ~/.bashrc \
    && echo "alias gef='gdb -nx -ix $HOME/gef/gdbgef'" >> ~/.bashrc

RUN echo 'export PS1="[\[\e[34m\]\u\[\e[0m\]@\[\e[33m\]\H\[\e[0m\]:\w]\$"' >> /root/.bashrc

RUN mkdir -p /ctf/yu1hpa
WORKDIR /ctf/yu1hpa

