# Network Components

When it comes to networks, the whole purpose is to get data from one place to another
and from one machine to another machine, wether it is carrying voice, video, or data, it
is going to get across the network somehow.

So, what our networks are consist of?

## Clients

The machine that gets services. It uses resources over the network. The devices that the
user access network with. Such as our smartphones and laptops when they are using the
internet.

## Servers

The machine that provides services. It actually provides the resources to the networks.
Like file servers, email servers, web servers, and many others

## :question: Hubs

Old technology, not used these days. They are devices that connect other devices like
clients and servers over a local area network.

> :question: They have limitations, such as increased network errors due to their
> broadcasting nature.

Hubs -> Bridges -> Switches.

## :question: Switches

:question: Smarter hubs. They provide more security and more bandwidth utilization.
Switches are used to connect network devices and only forward traffic from one port to
another destination port. This helps unnecessary broadcasting of the data over the
network.

## :question: Wireless Access Points(WAPs/APs)

Allow wireless devices to connect to a wired network. They broadcast data like the hubs
except they broadcast data over radio frequency waves instead of going over a copper or
fiber cable.

## :question: Routers

Use to connect different networks together. They can make intelligent forwarding
decisions based on the IP addresses of the different network components.

## Firewalls

Act as security barriers between internal and external network(usually the internet).
Firewalls could be hardwares, softwares, or a mix of both, monitoring and controlling
incoming and outgoing network traffic using some based upon predetermined rules named
access control lists.

## Load Balancers

Distribute network or application traffic across multiple servers(or instances).

> Increases capacity, efficiency, and reliability of the services. No server is going to
> be the bottleneck.

## Proxy

Act as an intermediate device between the user and the internet. It provides
functionalities such as:

- Web filtering.
- Shared network connections.
- Data caching.
- Enhancing security and privacy: By hiding the user's real ip.

## Intrusion Detection Systems(IDS)

Detect unauthorized access and anomalies and alert administrations. Sounds familiar:).

## Intrusion Prevention Systems(IPS)

Not only detect threats, but take actions to prevent intrusions.

> Like blocking the traffic coming to the network or dropping any harmful packet.

## :question: Controllers

They are going to particularly be used in software-defined networking(sdn), these are
the central units that are used to manage flow control to networking devices.

:question: are api gateways some kind of controllers?

## :question: Network-Attached Storage(NAS) Devices

They are dedicated file storage systems that provides that access to heterogenous group
of clients.

## :question: Storage Area Networks(SAN)

High speed network that provide access to consolidated block-level data storage.

> They are designed to handle large volumes of data.

## Media

In the context of networking, media refers to physical materials used to transmit data.
They can be a copper cable, a fiber cable, or even wireless signals. Each type of these
medias has their own unique properties and limitations, so as the implication, they have
their own use cases in different network scenarios that I'll be designing.

## Wide Area Network(WAN) Links

Used to connect networks over large geographical areas. They enable data exchange over
long distances using technologies like :question: lease line, satellite communications,
or cellular networks.

So, why should I understand network components? How they gonna help me design,
implement, and troubleshoot efficiently? Because each one of these components has a
vital role ensuring secure and efficient data transmission. After all, networks are all
about transferring data from one place to another place, and the quality of the
transmission matters.
