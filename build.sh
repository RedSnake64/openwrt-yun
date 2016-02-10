#!/bin/bash -ex

#CHECK CONFIG FILE
if [ \! `test` -f '.config' ];
then
	cp config.default .config
fi

#ClEANUP
make clean

#FEEDS
./scripts/feeds uninstall -a
rm -rf feeds
./scripts/feeds update -a
./scripts/feeds install -a

#UNINSTALL BROKEN PACKAGES
./scripts/feeds uninstall redsocks seafile-ccnet seafile-server sstp-client tmux freeswitch umurmur-openssl umurmur-polarssl 

#DELETE PACKAGES
rm -rf ./package/feeds/packages/avrdude
rm -rf ./package/feeds/packages/rng-tools
rm -rf ./package/feeds/packages/python3
rm -rf ./package/feeds/packages/python3-bottle
rm -rf ./package/feeds/routing/batctl
rm -rf ./package/feeds/routing/batman-adv
rm -rf ./package/feeds/routing/batmand

#LINK CUSTOM PACKAGES
ln -s ../../../feeds/arduino/avrdude ./package/feeds/arduino/avrdude
ln -s ../../../feeds/arduino/rng-tools ./package/feeds/arduino/rng-tools
ln -s ../../../feeds/custom/python3 ./package/feeds/custom/python3
ln -s ../../../feeds/custom/python3-bottle ./package/feeds/custom/python3-bottle
ln -s ../../../feeds/custom/batctl ./package/feeds/custom/batctl
ln -s ../../../feeds/custom/batman-adv ./package/feeds/custom/batman-adv
ln -s ../../../feeds/custom/batmand ./package/feeds/custom/batmand

#DELETE CONFIG
rm -f .config

#BUILD OPTIONS
if [ "$1" == 'YUN_PACKAGES_ONLY' ];
then
	#BUILD ONLY YUN PACKAGES
	cp config.default .config
else
	#BUILD YUN PACKAGES AND OPENWRT PACKAGES
	cp config.yun.default .config
fi

make oldconfig

make
