# Setting Up and Customizing Personal Ubuntu

## First Steps

First:

```bash
ali> sudo apt update && sudo apt upgrade
```

Then, enable additional repositories

## What to install for Python, and how?

I recommend to manages the Python versions(and most things at the system level), using
`uv`.

```bash
ali> curl -LsSf https://astral.sh/uv/install.sh | sh
ali> echo -e \
  '# uv autocompletion\neval "$(uv generate-shell-completion bash)"\n' >> ~/.bashrc
ali> echo -e \
  '# uvx autocompletion\neval "$(uvx --generate-shell-completion bash)"\n' >> ~/.bashrc

ali> uv python install 3.10 3.11 3.12 3.13 3.14

ali> uv python pin --global 3.14
```
