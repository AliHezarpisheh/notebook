# SSH

An on-going page for writing down everything I have read about SSH and SSHing.

Secure Shell(SSH) is a layer 7 protocol, used for making secure connections to remote
servers in an unsecured network over an encrypted connection.

## Authentication

SSH prioritize these three authentication mechanism:

1. Public-key authentication.
2. Password authentication.
3. Keyboard-interactive (MFA) authentication.

The server and client negotiates which method to use, if the public-key authentication
is not available, the password authentication is replaced as fallback mechanism.

### Public-Key Authentication

SSH public-key authentication work on asymmetric cryptography. These are the steps:

1. You share the public key with the server but keep the private key to yourself.
2. The server will create a challenge when you try to connect to it.
3. The challenge is only solved with your private key, you send it through the wire.

> ⚠ So no password is shared in the wire. The identity is proven without sharing any
> secret.

```bash
ali> ls -la ~/.ssh/
total 36
drwx------  2 ali ali 4096 May 27 14:47 .
drwxr-x--- 41 ali ali 4096 Jun 10 12:31 ..
-rw-rw-r--  1 ali ali   70 May 27 14:33 config
-rw-------  1 ali ali 3401 Jun 30  2025 id_rsa
-rw-r--r--  1 ali ali  755 Jun 30  2025 id_rsa.pub
-rw-------  1 ali ali 7966 Feb 24 14:51 known_hosts
-rw-------  1 ali ali 7130 Feb 24 14:51 known_hosts.old

ali> ssh-keygen -t ed25519 -C "mioo@example.com"  # Generate new keys if necessary.

ali> ssh-copy-id root@192.168.1.1  # Or copy the public key manually to the server.
```

You can choose a passphrase to encrypt your private key, so even if someone stole it,
can not use it without the private key passphrase.

The keys inside `~/.ssh/authorized_keys` of the user in the server should contain public
keys.

## Configuration

`~/.ssh/config` is where the config file is.

### SSH Proxy

This is how you set a proxy for connecting to a SSH server.

```txt
Host 74.208.146.15
  ProxyCommand nc -X 6 -x 127.0.0.1:8086 %h %p
```

## Creating a SOCKS5 Proxy Using SSH - SSH Dynamic Port Forwarding

You run the below command on the machine to make a socks5 proxy on the 8086 port.

```bash
ssh -v -D 127.0.0.1:8086 -C -N root@192.168.1.1
```

Then, you should change the proxy configuration of your system or apps to route the
traffic through this proxy. That's as simple as that.
