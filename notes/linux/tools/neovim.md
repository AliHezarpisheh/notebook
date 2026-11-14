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
So, the config should be modular, below I enter everything about how to start
configuring and making different modules our neovim setup. First, we're not going to use
any plugins or distributions, just neovim itself.

  # `utils/` general utilities.
ali - ~/.config/nvim> cd config/
ali - ~/.config/nvim/config> touch {keymaps,autocmds,options,global,lazy}.lua
```

## Package Manager

There are multiple package mangers for neovim, basically a package manager is a package
that can manage other packages related to neovim's environment.

I'll use [lazy](https://github.com/lazyvim/lazyvim).

### lazy.nvim

By default, every plugin is loaded at startup. Lazy-loading a plugin means loading a
plugin only when something triggers it. **lazy.nvim** supports four triggers on a plugin
spec:

| Trigger | Loads the plugin when...                                                                              |
| ------- | ----------------------------------------------------------------------------------------------------- |
| `event` | an event fires (`InsertEnter`, `BufReadPost`, or `VeryLazy`, which is shortly after startup finishes) |
| `cmd`   | you run one of its commands                                                                           |
| `ft`    | you open a file of that type                                                                          |
| `keys`  | you press one of its mappings                                                                         |

A spec with none of these loads at startup, unless I set `lazy = true`. Some plugins
must load lazy, like a colorscheme.

Run `:Lazy` to work with it. No explanation needed, working with lazy is
straightforward.

#### Profiling Lazy

You should profile your neovim startup and lazy if you feel that the process is slow.
Two main commands help you profile lazy and neovim startup:

- `:Lazy profile`: Check what plugin load time is the bottleneck of the startup process.
- `nvim --startuptime /tmp/startup.log +q`: Neovim's native way to profile.

## LSP

A **Language Server Protocol** is a suite of well-define standards and message formats
that language server can send to an editor. A **Language Server** is a software that
analyze the code and tells text editor about it which usually results in features such
as auto-complete, hover documentation, and go-to definitions. This is standardized so
each language and editor doesn't have their own way to handle these tasks.

### More on Language Servers

A language server talks LSP over stdin/stdout. For neovim's built-in LSP client to use
one it has to know a few things:

- **cmd**: The command that launches the server (e.g. `lua-language-server`).
- **filetypes**: Which buffer should the server attaches to (e.g. `lua`).
- **root_markers**: How to find the project root.
- **settings**: Some server-specific options.

Without `nvim-lspconfig` I should write all of these by hand in `~/.config/nvim/lsp/`
directory for every server. `nvim-lspconfig` ships folder of small files in that
directory, each returning a table like this:

```lua
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
}
```

In neovim 0.11+, those files sit on the `runtimepath` and when
`vim.lsp.enable("lua_ls")` is called, neovim searches for it and uses it. If
`vim.lsp.config("lua_ls", { settings = ... })` is called, the returned table is merged
with the default one. See it for yourself:

```bash
:lua =vim.lsp.config.lua_ls
:lua =vim.api.nvim_get_runtime_file("lua_ls", true)
```

#### Mason

Here, I wants to mention `mason.nvim`. Mason fits here because it puts the server
binaries in a directory that is added to the neovim's **PATH**, so **cmd**s could
resolve.

#### blink.cmp

Take auto-complete to next level using `blink.cmp`. `friendly-snippet` is also a good
option installed alongside `blink.cmp`.

### Treesitter

Treesitter is a parser framework. It lets the editor know what the general syntax of
language is. Nothing more.

Traditional vim syntax highlighting uses regex, which doesn't understand code structure.
On the other hand, Treesitter is an incremental parser. It builds a real syntax tree of
the buffer and updates the only the changed part as you type. Features then query the
tree instead of guessing.

Neovim includes the treesitter's engine (vim.treesitter).

## Folding

## Troubleshooting

- `:messages` show errors and notifications.
- `:checkhealth` shows what's missing from the system, per plugin.
- `:verbose mpa <key>` shows what a key is mapped to and where it is defined.
- `:Inspect` shows highlights under the cursor.
- `:scriptnames` shows every loaded file.
- `nvim --clean` starts neovim without any config.
