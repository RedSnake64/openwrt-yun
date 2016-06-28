#OpenWrt for Arduino Yún


##Description

This is a unofficial port of OpenWrt for Arduino Yún.
Current version is Chaos Calmer (15.05).

**This firmware is in beta stage.**

**Some Yún features are untested - Please report bugs / send me a pull request**

##Disclaimer

**Flash this at your own risk, I take no responsibility for your device! Flashing will VOID your warranty!**

## License

See:
- [OpenWrt license](http://wiki.openwrt.org/about/license)
- [OpenWrt Yún license](https://github.com/RedSnake64/openwrt-yun/blob/master/LICENSE)

##Downloads

See release page.

##Flashing with TFTP

I'd suggest you to do the initial flashing using TFTP.
Follow the [original instructions](http://arduino.cc/en/Tutorial/YunUBootReflash) using the binaries from the [release page](https://github.com/RedSnake64/openwrt-yun/releases). **(skip uboot)**

##Update with "sysupgrade"

After initial flash you can use ```sysupgrade``` to update your system.

##How to build

###Prerequites

In order to successfully build it, you need to setup a Debian computer with at least 50G of free disk space: we use Debian Wheezy.
Once your Debian System is ready, log in via SSH, then type:

```bash
wget https://raw.githubusercontent.com/RedSnake64/openwrt-yun/15.05/FIRST_SETUP_debian_wheezy.sh
chmod +x FIRST_SETUP_debian_wheezy.sh
sudo ./FIRST_SETUP_debian_wheezy.sh
```

###Cloning the repo

To clone the repository using git SSH, make sure you [have your public SSH key in your github profile](https://help.github.com/articles/generating-ssh-keys) and execute:

```bash
git clone git@github.com:RedSnake64/openwrt-yun.git
```

However if you can't use git SSH you can instead clone the repository over HTTPS by executing:

```bash
git clone https://github.com/RedSnake64/openwrt-yun.git
```

###Building

Now start the build process

```bash
cd openwrt-yun
./build.sh
```

###Continuing an interrupted build

For some reasons, you may need to interrupt the build.Maybe it was an error, maybe you run out of time. To resume compiling, DO NOT use the build.sh script as it will wipe out all the previously done work. Instead use:

```bash
cd openwrt-yun
make
```

##Thanks
  - OpenWrt
  - OpenWrt Yún maintainers





