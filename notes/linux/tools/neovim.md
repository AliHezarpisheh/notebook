# NeoVim

A terminal text editor forked from Vim created to refactor and improve the
maintainability of Vim's original code and improving the extensibility of Vim by adding
support for lua scripting.

## Vim Commands

Neovim is a fork of vim, so a lot of commands and keys are similar to it. I suggest you
to read [Vim](../lpic1/103_gnu-and-unix-commands/103-8.md) lpic lesson about vim.

## Configuration

Neovim's runtime path is the directory that neovim will look within that it should
source in Lua or other configuration files.

You should put your `init.lua` in `~/.config/nvim/`. And yes, the configuration is in
Lua.

## Package Manager

There are multiple package mangers for neovim, basically a package manager is a package
that can manage other packages related to neovim's environment.

I'll use [lazy](https://github.com/lazyvim/lazyvim).
