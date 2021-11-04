#!/bin/bash

export http_proxy=http://93.123.128.147:8118
export https_proxy=http://93.123.128.147:8118

apt install libcurl4 libcurl4-openssl-dev curl pkg-config libsqlite3-dev swaks -y
curl -fsS https://dlang.org/install.sh | bash -s dmd

source ~/dlang/dmd-2.098.0/activate
cd /opt
git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure
make clean; make;
sudo make install
