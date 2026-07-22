# How to Create a Service

You can use `systemd` to create long-running processes that could be run on the
background, enable at startup, and restart in case of failure.

Best practices suggests that we should put our own service files in
`/et/systemd/system/` directory. Installed programs put their services or unit files in
`/usr/lib/systemd/system/` or similar places. Although I'm seeing unit files of some of
th installed apps in the `/etc` directory on my ubuntu 22.

## Unit File Structure

Create the file with `.service` at the end of it.

```bash
root> touch ssh-dey-proxy.service
```

A `.service` file tells `systemd` three things:

- **Unit**: Metadata and ordering. Answer to *What is it and what should happen
  before/after it?*
- **Service**: How to actually run it. It includes the command and process behavior.
- **Install**: How it hooks into boot/enable.

This is an example of the file:

```txt
[Unit]
Description=SSH Socks5 proxy via Dey server
After=network-online.target
Wants=network-online.target
StartLimitIntervalSec=30
StartLimitBurst=2

[Service]
Type=simple
ExecStart=/usr/bin/ssh -D 127.0.0.1:8086 -C -N mahdi@74.208.146.15
Restart=on-failure
RestartSec=5
User=root
Group=root

[Install]
WantedBy=multi-user.target
```

These are `[Unit]` parameters:

- **Description**: Human-readable description, shown at `systemctl status`.
- **After**: The service should start after what other units? Mostly, targets or other
  services are specified here.
- **StartLimitBurse**: Explained below.
- **StartLimitIntervalSec**: Explained below.

These are `[Service]` parameters:

- **Type**: `simple` means the process I start is the service, don't expect
  fork/daemonize.
- **ExecStart**: The actual script or command. The path should be absolute.
- **Restart**: By default, `systemd` won't restart the service in case of failure, you
  should set this option. The options are: always, on-failure, on-success, on-abnormal,
  on-watchdog, on-abort, and the default one: no.
- **RestartSec**: Sets a delay before `systemd` tries to restart the service. By
  default, `systemd` restarts the service after 100ms.
- **User**: The user running that should run the script.
- **User**: The group running that should run the script.

These are `[Install]` parameters:

- **WantedBy**: What `systemctl enable` actually uses. It means when the system reaches
  the normal multi-user step, you should start this.

`systemd` will give up restarting the service if it fails to restart it more than 5
times within 10 seconds interval. There are two `[Unit]` configuration responsible for
that: `StartLimitBurst` and `StartLimitIntervalSec`.

```txt
StartLimitBurst=5
StartLimitIntervalSec=10
```

`StartLimitIntervalSec=0` will make `systemd` retry the service forever.

## Commands

Test the file without guessing:

```bash
ali> sudo systemd-analyze verify /etc/system/systemd/ssh-dey-proxy.service
ali> sudo systemctl daemon-reload
ali> sudo systemctl start ssh-dey-proxy.service
ali> sudo systemctl enable ssh-dey-proxy.service

ali> journalctl -xeu ssh-dey-proxy.service
```

## System's Sleep

`systemd` will automatically runs every executable scripts in
`/usr/lib/systemd/system-sleep/` directory. The scripts are called **systemd hook
scripts**.
