# Network Resources

When we think about network resources, we have to think about how data is transferred
over the network.

We break down into two main models:

## Client-Server

The client-server model is going to use a dedicated server to provide access to
printers, scanners, files, and other resources on the network.

### Benefits of Client-Server Model

- Centralized administration: Everything is on the server and we have to only manage
  that server.
- Ease of backup: We can just backup the the server. Everything is on that.
- Easier management: This would make sense when you understand peer-to-peer model. In
  client-server model, you just have to manage the server.
- Better scalability: :question:.

### Drawbacks of Client-Server Model

- Cost more money: The server needs dedicated hardware, it needs professionals
  maintaining them and there are bills too!
- Requires dedicated OS: You need to install a specific operating system on the server.
  This would make more sense too when you learn about the other model.
- Requires specialized skillset: You need some professionals constantly working on those
  servers.

> It is the leading model we use in the businesses these days.

## Peer-to-Peer Model(:question:)

Peers or other machines(e.g. laptops, desktops) can share resources together directly.

### Benefits of Peer-to-Peer Model

- Lower cost: No hardware, no specialized os, just a software that you can share
  resources over the network.
- No dedicated OS needed.
- No dedicated resources or professional workings on the servers.

### Drawbacks of Peer-to-Peer Model

- Backup is super hard: There is no central unit for storing things. Everything is
  everywhere! Imagine a network using a peer-to-peer model, with more than thousands of
  users. How can you backup?
- Harder management: Every device can become share resources over the network. This
  absence of a central machine, makes management harder.
- Decentralized management.
- Poor scalability.

> All the drawbacks of client-server model is benefits of the peer-to-peer model, and
> vice-versa.
