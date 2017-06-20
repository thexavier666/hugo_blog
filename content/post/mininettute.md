---
author: Sumitro
date: 2017-06-20T16:20:57+05:30
description: Just the basic steps to get started with Mininet and POX
draft: true
#keywords:
#- key
#- words
tags:
- mininet
- pox
- tutorial
- networking
- sdn
title: Mininet + POX Tutorial
topics:
- topic 1
type: post
---

## Installation

There are two ways of installing Mininet. Each method has it's pros and cons

1. Downloading the Mininet VM
2. Building Mininet from source

I'll discuss why each method is used but it's up to you to implement it

### Using VM

This is the easiest way as you simply download the VM and execute the Mininet that comes pre-installed in it. Using a VM manager like VVirtual Box or VM Player.

### Building VM from source

This is slightly time-consuming (but not difficult)

1. Download mininet from git

	`git clone https://github.com/mininet/mininet`

2. Edit the file `mininet/util/install.sh`
3. Replace all `git://` to `https://`
4. Save and exit
5. Install mininet by the following command

	`./util/install.sh -fnv`

6.  Read the `INSTALL` file in `mininet/` to understand what the flags mean

## Creating Topology

## Starting a controller in POX

1. Go to the Pox directory
2. Start the Pox controller and link it to an application. An application in our case is a simple L2 switch named `l2_forwarding.py`. This file is located in `pox/forwarding/`

	`./pox.py log.level --DEBUG forwarding.l2_learning`

	*Note : `log.level --DEBUG` allows us to see the actions of the controller with more details*

## Connecting the controller
