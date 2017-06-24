---
author: Sumitro
date: 2017-06-23T14:59:50+05:30
description: Linux installation tutorial. Cheap! Buy now! Fast!
draft: false
keywords:
- linux
- tutorial
- installation
- laptop
#tags:
#- one
#- two
title: Post-installation GNU/Linux in IIT KGP
topics:
- topic 1
type: post
---

This is just a tutorial/guide for myself because I need to install and reinstall Linux quite a few times. Some of the tips are for laptops only. They will be tagged with [Laptop]. I generally install Ubuntu Mate in all machines because it's light and stable.

## Network connectivity

### Adding proxy
Edit the file `/etc/profile` and add the following lines

```shell
export http_proxy="http://10.3.100.207:8080"
export https_proxy="http://10.3.100.207:8080"
export ftp_proxy="http://10.3.100.207:8080"
export no_proxy="localhost,127.0.0.1,10.0.0.0/8"
```

### Enabling proxy for `apt`

This is required for installing updates.
Edit the file `/etc/apt/apt.conf` and add the following lines

```shell
Acquire::http::proxy "http://10.3.100.207:8080";
Acquire::https::proxy "http://10.3.100.207:8080";
Acquire::ftp::proxy "http://10.3.100.207:8080";
```

## Installing important tools

Install the following tools. However, these are not mandatory for everybody

1. `openssh-server` - For SSH'ing
2. `screen` - Terminal multiplexing
3. `brightness-controller` [Laptop] - Since latops don't provide display temperature control
4. `htop` - For system status
5. `vim` - For VIM'ing

A simple one-liner for installing all of the above

`sudo apt-get install openssh-server screen htop vim`

## Customizing the looks

The [Arc theme](3) and [Oranchelo](4) icon pack combo is perfect for me. You can try it out.

Note : The [Numix Circle icon](5) pack is also quite nice

#### Installing Arc theme

```shell
sudo -E add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install arc-theme
```

#### Installing Oranchelo icon-pack

```shell
sudo -E add-apt-repository ppa:oranchelo/oranchelo-icon-theme
sudo apt-get update
sudo apt-get install oranchelo-icon-theme
```

#### Installing Numix Circle icon-pack

```shell
sudo -E apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme numix-icon-theme-circle
```

Note : I need to add `-E` everytime I need to add a PPA. I need to find out why. If somecan help me out, it would be very nice.

## Miscellaneous Tasks

#### Disabling bluetooth

You may not want to do this if you use Bluetooth frequently. I have posted the one which worked for me here. Try out the other options mentioned [here][1].

1. Edit the file at `/etc/rc.local`
2. Find the line `exit 0`, say it's line 100
3. Before line 100, add the following line
    `rfkill block bluetooth`

#### Enabling static IP

1. Edit the following file `/etc/network/interfaces`
2. Find the primary network interface. It should be `eth0` most of the time
3. Put the following text
    ```shell
    auto eth0
    iface eth0 inet static
        address 10.20.30.40
        netmask 255.255.255.0
        broadcast 10.20.30.255
        gateway 10.20.30.1
        dns-nameservers 8.8.8.8
    ```
4. Reboot the system (Restarting the NIC won't do)

#### Changing name of network interface
1. Edit the file `/etc/default/grub` changing the line from
    - `GRUB_CMDLINE_LINUX=""` to
    + `GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"`
2. Update the grub
    `sudo update-grub`
3. Reboot your system
    `sudo reboot`

#### Disable sleep when laptop lid is closed [Laptop]
Check out the answers mentioned in the link over [here][2]. The answer which worked for me is as follows

* Edit the file `/etc/systemd/logind.conf`
* Find the line `#HandleLidSwitch=suspend`
* Set it to `HandleLidSwitch=ignore` if you don't want anything to happen with a lid close
* Set it to `HandleLidSwitch=lock` if you want the screen get locked with a lid close

[1]: (https://askubuntu.com/questions/67758/how-can-i-deactivate-bluetooth-on-system-startup)
[2]: (https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed/594417#594417)
[3]: (https://github.com/OrancheloTeam/oranchelo-icon-theme)
[4]: (https://github.com/horst3180/arc-theme)
[5]: (https://github.com/numixproject/numix-icon-theme-circle)
