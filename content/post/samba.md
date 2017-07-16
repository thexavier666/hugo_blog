---
author: Sumitro
date: 2017-07-16T21:48:03+05:30
description: Do you have what it takes to create a Samba drive?
draft: false
#keywords:
#- linux
#- samba
tags:
- linux
- samba
title: Creating a Samba drive in Linux
topics:
- topic 1
type: post
---

Creating a Samba drive on Linux has several advantages.

1. It is cross-platform

Well, that's it.

It has its issues though, like the recent randomeware attack **WannaCry** was based on an exploit "EternalBlue" which was present in Samba.
However, if we can overlook it, we can create an easy file sharing system.

Now let us see how to create a Samba drive


## Steps to take

* Install Samba

	```
	sudo apt-get install samba
	```

* Create user for Samba

	I've decided to name the user `achilles`

	```
	useradd achilles
	passwd achilles
	```

	**Note** : It is advisable to not add a `sudo` user as a samba user. Otherwise, you will lose sudo permission. 

* Create a directory to be shared

	```
	mkdir /smb_user
	chmod 770 /smb_user
	```

* Create group for Samba

	The name of the group is WORKGROUP simply because of Windows traditions :smile: 

	```
	groupadd WORKGROUP
	chown :WORKGROUP /smb_user
	```

* Add user to Samba group

	```
	smbpasswd -a achilles
	usermod -G WORKGROUP achilles
	```

* Edit the file `/etc/samba/smb.conf`. Add the following at the end of the file. Try to understand the following on your own.

	```
	[achilles]
		comment = Linux Samba Share
		path = /smb_user
		browsable = yes
		guest ok = yes
		read only = yes
		create mask = 0755
	```

* Restart Samba service

	```
	sudo systemctl restart smbd.service nmbd.service
	```

That's it, you're done!

If you want to access the server from a Linux machine, go to your file browser and enter the URL `smb://<ip address>`

On Windows machine, it should be `\\<ip address>`

---
