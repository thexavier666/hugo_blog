---
author: Sumitro
date: 2017-06-20T12:30:31+05:30
description: Read the title. No clickbait over here
draft: false
#keywords:
#- key
#- words
tags:
- openflow
- open vswitch
- sdn
- switch
- tutorial
title: Creating an actual OpenFlow-enabled Switch
topics:
- topic 1
type: post
---

<center>![OpenFlow Logo](../../../../images/openflow_logo.png)</center>

<br>

### Hardware needed to create a OpenFlow switch

All of this should be available at a good computer hardware store. We ordered it from Amazon

1. PC with enough USB 3.0 ports
2. PCI Express USB 3.0 card with extra ports if (1) is missing (See image)
3. A PCI Express extender if (2) does not fit the cabinet
4. USB 3.0 to Gigabit Ethernet adapters

<figure>
    <center><img src="../../../../images/pcie_usb_card.jpg" style="width:50%; height:50%" /></center>
    <center><figcaption>PCI USB Card</figcaption></center>
</figure>

<br>

_Note : You might be wondering why bother with all this when we can simply buy a PCI Express Gigabit Ethernet adapter with multiple ports. I tried it, none of them were compatible with our board. Also, they were quite expensive_

### Software needed

Open vSwitch

    sudo apt-get install openvswitch-switch

### Integration of the hardware and the software

1. Connect the PCI Express card to the motherboard
2. Connect all the USB dongles to the newly installed card
3. Note the interface names of the newly created interfaces. Say they are `eth1`, `eth2` and `eth3`
4. Create a bridge. Say it's `br0`
        ovs-vsctl add-br br0
5. Connect the interfaces to the brige `br0`

        ovs-vsctl add-port br0 eth1
        ovs-vsctl add-port br0 eth2
        ovs-vsctl add-port br0 eth3
6. Connect a controller to the bridge

        ovs-vsctl set-controller br0 tcp:10.10.5.20:6633


And that is all. You now have a Gigabit OpenFlow switch!
