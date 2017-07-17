---
author: Sumitro
date: 2017-06-25T22:26:10+05:30
description: A script to check if Internet is working
draft: false
keywords:
- key
- words
tags:
- KGP
- Internet
- gist
title: Waiting for Internet in IIT KGP
topics:
- topic 1
type: post
---

Since KGP uses an HTTP proxy for all it's activities, it can be a giant [PITA][2] sometimes to make some applications work here.

One of them is the simple `ping` tool. I cannot use it to check if a machine is online if it is outside KGP.

However, I mostly use `ping` to check if the Internet is working, which sometimes goes down when there is heavy rain.

Hence, I'm created my own script to detect Internet using `curl`.

Initially, I used `wget` but it generates a file everytime the Internet comes back. Hence I moved to `curl`

The basic logic/pseudocode of the code is

```python
while True
	do curl

	if output of curl is a proper webpage

		print 'Net is back'

		exit program

	else
		print 'Waiting for net'
```

You can find the source code [here][1]

[1]: https://gist.github.com/thexavier666/88a50c25316442eb293f0232a69250e7
[2]: http://www.urbandictionary.com/define.php?term=pita
