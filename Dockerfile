FROM ubuntu:20.04

RUN dpkg --add-architecture i386

COPY ./run/aptget-install.sh aptget-install.sh
RUN chmod +x aptget-install.sh
RUN ./aptget-install.sh

RUN locale-gen en_US.UTF-8
ENV LANG en_US.utf8

COPY ./run/pwncmd.sh pwncmd.sh
RUN chmod +x pwncmd.sh
RUN ./pwncmd.sh

RUN mkdir -p $HOME/gef \
    && cd $HOME/gef
COPY ./run/debugger-install.sh debugger-install.sh
RUN chmod +x debugger-install.sh
RUN ./debugger-install.sh

RUN echo 'export PS1="[\[\e[34m\]\u\[\e[0m\]@\[\e[33m\]\H\[\e[0m\]:\w]\$"' >> /root/.bashrc

RUN mkdir -p /ctf/yu1hpa
WORKDIR /ctf/yu1hpa

