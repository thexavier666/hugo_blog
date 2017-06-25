---
author: Sumitro
date: 2017-06-26T00:34:45+05:30
description: Discussion about some issues which I faced while installing Ubuntu Mate (I think this is related to Linux as a whole)
draft: false
keywords:
- key
- words
tags:
- linux
- install
- tutorial
title: While installing Linux...
topics:
- topic 1
type: post
---

Last night, I was installing Ubuntu Mate in a machine which already had Ubuntu installed in it. But this version was installed in LVM logical volumes. I still have to learn LVM but that is for another day. The issue that I was facing was that I could not delete those partition during installation. After some hopeless searching, I decided to use `fdisk` to delete them, and it worked!

This is how I did it

### Deleting a partition before installing Linux

1. Open the terminal
2. To list out all the disks, enter 
	
	`sudo fdisk -l | grep '^Disk'`

3. Identify your hard disk from the list. Say it's `/dev/sda`
4. To format the disk, enter 
	
	`fdisk /dev/sda`

5. You will be asked for an option. Press `m` for help. Press `d` to delete a partition
6. If your disk has multiple partitions, a partition number will be asked (There were multiple LVM logical volumes). Repeat the process multiple times till there are no more partitions. You can create partitions while installing Linux

#### Note

While deleting partitions, make sure not to delete any attached USB drives (which usually is the Linux installation media)

### Deciding partition size

* `boot` - 1 GB is more than enough. 512 MB is best
* `swap` - There is a lot of discussion regarding `swap` size. It would be good if you [read about what it is][1]. Refer the table for the correct size. I have 8 GB RAM, so I use 8 GB `swap`
* `root` - A standard commercial installation takes 7-8 GB. So I give it an extra 20 GB space for all tools (total of 30 GB), which should last me 5 years. Linux tools anyway take very space.
* `home` - Rest of the hard disk :)

[1]: (https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s2-diskpartrecommend-ppc.html)
