# Wired Network Topology

## Network Topology

A network topology refers to the arrangement of different elements like links, nodes,
clients, servers that make up a computer network. We have two main network diagrams and
documentations when we are talking about network topologies.

> What is the importance of understanding network topologies? The reason for that is
> that you should be able to design efficient and resilient network infrastructure.

### Physical Topology

A physical topology used to show how the network devices and components are physically
cabled and connected together. For example, if you have the map of your room, and
identify and connect the network components together, you can have your physical diagram
of your LAN network.

:question: Put a picture here.

### Logical Topology

It talks about how the traffic is actually going to flow through our network. Our
consideration is how the data is flowing in the network not how the resources are cabled
to each other.

:question: Put a picture here.

> As you may know, this diagram doesn't show the actual physical location of the network
> resources.

Let's start learning about the six different topologies.

## Point-to-Point

It is the simplest form of network topology that involves a direct connection between
two devices.

They are usually used to connect a computer to a network peripheral, like a scanner or
printer.

It is reliable and straightforward for small-scale connections but it is not reliable
for larger networks. The only exception of point-to-point topology being used in large
enterprise-scale networks is really for the WAN connections, when you want to connect
one of the remotes offices in another city all the way back to one of the offices in
another city using a point-to-point fiber connection between those two facilities.

:question: Put a picture in every topology's section

## Ring

A ring topology is a network configuration where each device is connected to two other
devices, forming a circular data path. In this setup, data is going to travel in one
direction, clockwise or counterclockwise until it reaches its destination.

One of its benefits is that it's going to prevent data collisions due to using this
unidirectional flow. However one of the devices can be a single point of failure if one
node fails, unless you have redundant connections for failover.

> They are not very common these days, unless you want to use fiber distributed data
> interface(FDDI) connections. This is used to conduct data transmissions on fiber optic
> lines in a local area network. And can actually extend up to a range of about 200
> kilometers. :question:. FDDI is known for high bandwidth that makes it suitable for
> environments with large data transfers and high reliability requirements such as
> campus area networks or datacenters.

## Bus

In a bus topology, all of the network devices are connected to a single central cable,
called the bus or backbone.

The bus can be the single point of failure. Any device can send data to every other
device on that bus but only the intended recipient that is identified by a unique
address will actually process the message that it's seeing.

> They are easy to install and do not need a huge load of cables.

Due to more data collisions happening on the cable, if more nodes are going to added to
the bus, the network could become short on performance.

> Similar to ring networks, they are not commonly used nowadays and they are considered
> old.

## Star

It is one of the most common network layouts that are in used today. My own home network
is most likely using a star topology right now!

In a star topology, each node in the network is going to connect back to a centralized
connection point which is normally going to be a network switch. That switch can also
act as a repeater for your network's data flow.

This is a robust topology, because failure of one link doesn't affect any other link,
however the failure of the connection point, means failure of the whole network.

## Hub-and-Spoke

This is a variation of star topology where the central node(hub) is connected to
multiple nodes(spokes). This nodes are not directly connected to each other, so they
must transmit their dat to one of the hubs, before that data is going to be forwarded to
another hub, and then onward to the final destination node in that spoke. :question:.

This layout is commonly used in airlines as well as in telecommunication networks.

## Mesh

It features a point-to-point connection between every single device on the network to
create robust, and redundant network.

### Full-Mesh

Every node of the network is connected to every other nodes. We will have `n(n-1)/2`
links between the nodes, the amount of links in a full-graph with n nodes. It could be
very expensive to install because of numbers of cables and ports.

> Impractical!

### Partial-Mesh

Every node is not connected to every other node. We can have a full-mesh in a sub-graph
of our network and other nodes can be connected to some of the devices. We can do this
if some nodes are critical to use and have to have direct connection to each other.
