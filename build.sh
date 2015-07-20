#!/bin/bash -ex

make clean

#DELETE CONFIG
rm -f .config

#BUILD ONLY YUN PACKAGES
#cp config.default .config

#BUILD YUN PACKAGES AND OPENWRT PACKAGES
cp config.yun.default .config

# FEEDS
./scripts/feeds uninstall -a
rm -rf feeds
./scripts/feeds update -a
./scripts/feeds install -a

#UNINSTALL BROKEN PACKAGES
./scripts/feeds uninstall redsocks seafile-ccnet seafile-server sstp-client tmux freeswitch umurmur-openssl umurmur-polarssl 

# DELETE PACKAGES
rm -rf ./package/feeds/packages/avrdude
rm -rf ./package/feeds/packages/rng-tools

# LINK CUSTOM PACKAGES
ln -s ../../../feeds/arduino/avrdude ./package/feeds/arduino/avrdude
ln -s ../../../feeds/arduino/rng-tools ./package/feeds/arduino/rng-tools

make oldconfig

make
