#!/bin/bash
python3 -m pip install --upgrade pip \
&& python3 -m pip install setuptools \
&& pip3 install \
pwntools \
capstone \
ropgadget \
ropper

gem install one_gadget
