#!/bin/bash -ex

make clean

# FEEDS
./scripts/feeds uninstall -a
rm -rf feeds
./scripts/feeds update -a
./scripts/feeds install -a
./scripts/feeds uninstall erlang freeswitch remotefs libzstream shflags opensips pulseaudio xmlrpc-c rtorrent sox umurmur-polarssl freecwmp-zstream osirisd logtrigger libimobiledevice cmus mxml boost wt etherpuppet php4 ksymoops lisbmob mutella netatalk openswan seeks yapsnmp librrd l7-protocols-testing reaver lispd crypto-tools mosh-client mosh-full mosh-server rrdcgi rrdtool 

# DELETE OLD PACKAGES
rm -rf ./package/feeds/oldpackages/bluez-hcidump
rm -rf ./package/feeds/oldpackages/bluez-libs
rm -rf ./package/feeds/oldpackages/bluez-utils
rm -rf ./package/feeds/oldpackages/cwiid
rm -rf ./package/feeds/packages/rng-tools
ln -s ../../../feeds/arduino/bluez ./package/feeds/arduino/bluez
ln -s ../../../feeds/arduino/cwiid ./package/feeds/arduino/cwiid
ln -s ../../../feeds/arduino/rng-tools ./package/feeds/arduino/rng-tools

# CONFIG

if [ "$BUILD_BASE_ONLY" = "Yes" ]; then
	rm -f .config
	cp config.default .config
else
	rm -f .config
	cp config.yun .config	
fi

make oldconfig

make
