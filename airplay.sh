#!/bin/bash

# Update the OS
sudo apt-get update -y

# Swithc Audio Output To 3.5mm Jack
sudo amixer cset numid=3 1

# Set Voulme To 100%
amixer cset numid=1 -- 90%

# Install Required Libraries
sudo apt-get install autoconf automake avahi-daemon build-essential git libasound2-dev libavahi-client-dev \
libconfig-dev libdaemon-dev libpopt-dev libssl-dev libtool xmltoman

# Setup Airplay
cd /home/pi
git clone https://github.com/hendrikw82/shairport.git
cd shairport
autoreconf -i -f
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata
make
sudo make install

# Setup Shairport As A System Service
sudo systemctl enable shairport-sync
sudo service shairport-sync start