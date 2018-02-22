---
author: author
date: 2018-02-22T21:51:02+05:30
description: Installing drivers for an Asus Wifi dongle
draft: false
keywords:
- key
- words
tags:
- asus
- wifi
title: Using the Asus AC56 in Linux
topics:
- topic 1
type: post
---

This USB Wifi dongle was bought by our lab. But when I finally got it in my hands, I saw that the driver CD was missing. So I decided to hunt for the driver from the interwebz. This is my journey.

1. Download the driver from this [link][1]. Download it as a ZIP
2. Unzip the contents and go inside the directory
3. Get all essentials for `make`

    ```
    sudo apt install linux-headers-generic build-essential
    ```

4. Make and install

    ```
    make
    sudo make install
    ```
5. Reboot. You should now be able to see wifi APs. Check with the command

    ```
    sudo iwlist wlan0 scan | grep -i ESSID
    ```

See the previous post regarding how to connect to an AP.

[Source : Stackoverflow][2]


[1]: https://github.com/codeworkx/rtl8812au_asus
[2]: https://askubuntu.com/questions/404881/how-do-i-install-an-asus-usb-ac56-wifi-adapter
