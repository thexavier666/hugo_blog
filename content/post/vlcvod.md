---
author: Sumitro
date: 2017-07-17T19:28:23+05:30
description: description
draft: false
#keywords:
#- key
#- words
tags:
- vlc
- streaming
- vod
title: Starting a VLC Video-on-Demand Server in Linux
topics:
- topic 1
type: post
---

Using Video-on-Demand (VOD) has several advantages

* It's faster since it uses UDP instead of TCP
* You can pause/play/rewind/fast-forward compared to traditional RTP
* Lesser overhead compared to RTP as RTP needs to transcode on-the-fly

## Starting the VOD Server

1. Start the VLC Video-on-demand server. The server is running at `10.5.20.114` at port `554`.

	```
	sudo vlc-wrapper --ttl 12 -vvv --color -I telnet --telnet-password videolan --rtsp-host 10.5.20.114 --rtsp-port 554
	```

2. Login to the VOD server via telnet which is running at port `4212` at the same IP. The password is `videolan` as mentioned above

	```
	telnet 0.0.0.0 4212
	```

3. Now you have to create a media object and link a media content to this object. This can be also be done by loading a script inside the telnet session. The name of the object I've created is `myvideo`

	```
	new myvideo vod enabled
	setup myvideo input path/to/video.mp4
	```

That's it, the video is now being hosted in your server.

## Accessing the video

You can view the video by using the URL `rtsp://10.5.20.114:554/myvideo`. You can also access it by command line by `vlc-wrapper rtsp://10.5.20.114:554/myvideo`

## Automatic loading of video into the VOD server

Say you want to automatically login to the telnet server, create the object and add the media files. Then it is possible to write a script for it

1. Write a shell script as follows. Compare it with the above section to understand what is going on

	```
	# The telnet password
	echo "videolan"
	sleep 2
	# Creating the video object
	echo "new myvideo vod enabled"
	sleep 2
	# Adding the media file to the object
	echo "setup myvideo input path/to/video.mp4"
	sleep 2
	# Exiting telnet
	echo "quit"
	```
2. Run the script as follows

	```
	sh script_name.sh | telnet 0.0.0.0 4212
	```

This should be really handy during automation
