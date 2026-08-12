# Tmux

Tmux is a terminal multiplexer. It can create, access, and manage multiple terminals in
a single screen.

## Installation and Configuration

Install it using `sudo apt install tmux`. The system-wide configuration file goes under
`/etc/tmux.conf` and the user-specific one goes under `~/.tmux.config`.

## Concepts

### Attaching and Detaching

We can attach and detach from a tmux session. The session is running in the background
so anything we were doing and running on that session remains running. By attaching to
the session again, you will have your workspace still sitting there.

## Commands

Use `tmux` to create a new session.

Tmux is keyboard-driven. It means it can work with keybindings. In keyboard-driven
applications, there could be a concept named `prefix key`, which enable other
key-bindings to work. I wants to think of it as a way to say "hey, from now, the
keybindings are in the context of the tmux". The prefix key is `Ctrl + b` by default.

Let's list some useful keybindings, after we insert the prefix key:

- **%**: Split the window horizontally.
- **"**: Split the window vertically.
- **Arrows**: Move between panes.
- **Ctrl + Arrows**: Change the size of the current pane.
- **z**: Zoom-in or zoom-out a pane.
- **d**: Detach from the session.
- **c**: Create a new window.
- **numbers(0, 1, 2)**: Moving to the specified window.
- **n**: Moving to the next window.
- **,**: Rename the current window.
- **&**: Remove the window.
- **t**: Show time on the pane.
- **PgUp and PgDn**: Scroll the terminal.
- **s**: List all the tmux sessions.

You could press `Ctrl + b + :` to give tmux commands. Here are some useful commands:

- **set synchronize-panes**: Type your keyboard strokes in all the panes.

Let's learn some cli commands:

- **tmux** or **tmux new -s ali**: Create a session with name ali.
- **tmux ls** or **tmux list-sessions**: List session.
- **tmux att -t ali**: Attach to the `ali` session.

## Use Cases

Obviously, the main use case of tmux is re-attaching to a previously detached session.
You will have your workspace ready. Another obvious use case is having multiple
terminals on one screen.

There are also some other use cases, such as using tmux like nohup(not recommending it
for important process - just development or test processes), and poor-man's screen
sharing.

## Issues

### Tmux Color

Like any other thing in computer (except 0s and 1s), colors aren't just "sent-as-is".
Colors get described by a color code, and there's more than one language for that code:

- **True Color (24-bit)**: Make the exact colors, millions of possible colors, this is
  what a lot of tools are configured to use.
- **256-Color Mode**: Only 256 colors, and picks the closest color.

By default, tmux doesn't know it is allowed to pass true colors, so it translates it to
the 256-color list. For fixing it:

```bash
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",*256col*:RGB"
```
