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
title: Creating an actual OpenFlow-enabled Gigabit Switch
topics:
- topic 1
type: post
---

<center>![OpenFlow Logo](../../../../images/openflow_logo.png)</center>

<br>

Development in SDN can be an issue if you do not have access to proper hardware. Good SDN switches can cost upwards of 2000$ (Rs 1,50,000). An alternative to dedicated switches would be makeshift switches using standard PCs, with a few extra ports. Here is a tutorial showing how to convert a PC into an SDN switch.

### Hardware needed to create a OpenFlow switch

All of this should be available at a good computer hardware store. We ordered it from Amazon

1. PC with GNU/Linux installed and with multiple USB 3.0 ports
2. PCI Express USB 3.0 card with extra ports (See image)
3. A PCI Express extender if (2) does not fit in the cabinet (optional)
4. USB 3.0 to Gigabit Ethernet adapters

<figure>
    <center>
	<img src="../../../../images/pcie_usb_card.jpg" style="width:50%; height:50%" />
    </center>
    <center>
	<figcaption>PCI USB Card</figcaption>
    </center>
</figure>

<br>

#### Note

1. You can use a multiport Gigabit ethernet card but we could not find one which fits our motherboard. Also, they were quite expensive.
2. PCI Express extender is only required if your cabinet is small.

### Software needed

#### Open vSwitch

This allows us to create OpenFlow switches, both real and virtual. There is well supported and there exists enough documentation on it.

##### Installation
    sudo apt-get install openvswitch-switch

#### A controller

A controller is needed to create any SDN switch, otherwise, you need to insert OpenFlow rules manually. There are plenty of controllers available like Floodlight, Opendaylight, Ryu, Pox. We used Ryu. You can clone it from Github.

After installing it, run the Ryu controller in some machine. In our case, we ran the controller at a machine with IP address `10.10.5.20` at port `6633`

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
