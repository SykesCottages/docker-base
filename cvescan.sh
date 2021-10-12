#!/bin/sh

apt-get update
apt-get install -y -q python3-apt python3-pip
apt-get autoremove -y -q
apt-get autoclean -y -q
rm -rf /var/lib/apt/lists/*

git clone https://github.com/canonical/sec-cvescan
pip3 install --user sec-cvescan/
~/.local/bin/cvescan
