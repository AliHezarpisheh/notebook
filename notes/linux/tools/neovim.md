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

### Configuration Structure

So, the config should be modular, below I enter everything about how to start
configuring and making different modules our neovim setup. First, we're not going to use
any plugins or distributions, just neovim itself.

```bash
ali> mkdir -p ~/.config/nvim
ali> cd ~/.config/nvim
ali - ~/.config/nvim> touch init.lua  # The entrypoint.
ali - ~/.config/nvim> mkdir -p lua/{config,plugins,servers,utils}
  # `config/` is configuration specific to neovim.
  # `plugins/` manages plugins.
  # `servers/` ?
  # `utils/` general utilities.
ali - ~/.config/nvim> cd config/
ali - ~/.config/nvim/config> touch {keymaps,autocmds,options,global,lazy}.lua
```

## Package Manager

There are multiple package mangers for neovim, basically a package manager is a package
that can manage other packages related to neovim's environment.

I'll use [lazy](https://github.com/lazyvim/lazyvim).
