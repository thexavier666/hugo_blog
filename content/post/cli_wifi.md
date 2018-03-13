---
author: author
date: 2018-02-22T20:47:44+05:30
description: Showing an easy way to connect to wifi APs when GUI is missing
draft: false
keywords:
- key
- words
tags:
- wifi
- ap
- networking
title: Connecting to WIFI via the terminal in Linux
topics:
- topic 1
type: post
---

I have been searching for a solution to this issue for quite some time. Even though it's a simple task, linux can sometimes make it a hassle. In Stackoverflow, I found the following solution for WPA-protected wifi access points.
I'm assuming the name of the AP to be `foo` and the password to be `bar`, and the wifi interface to be `wlan0`

1. Create a WPA config file for your access point. This stores all details of the connection.

    ```
    wpa_passphrase foo > wpa_foo.conf
    ```

2. You will be prompted for a password. Type `bar`
3. A file named `wpa_foo.conf` will be created. Move to `/etc/` for security reasons
4. The 4th line of the file will contain the password in plain text (but it's commented). You can remove it for security.
5. Now, connect to the wifi using the following command

    ```
    wpa_supplicant -Dwext -B -iwlan0 -c/etc/wpa_foo.conf
    ```

6. Refresh `dhclient`

    ```
    dhclient -r
    ```

7. Ask for a new IP address

    ```
    dhclient wlan0
    ```

[Source : Stackoverflow][2]

Using this method, you should be able to connect, but I've found this to be unreliable. I've found another solution which uses the CLI of `Network Manager`. Keep it in mind that this might not be available in all versions of Linux. But this quite stable and simple and a one-liner.

    nmcli d wifi connect foo password bar ifname wlan0

Enjoy.

[Source : Stackoverflow][1]

[1]: https://askubuntu.com/questions/461825/how-to-connect-to-wifi-from-the-command-line/461831#461831
[2]: https://askubuntu.com/questions/138472/how-do-i-connect-to-a-wpa-wifi-network-using-the-command-line
