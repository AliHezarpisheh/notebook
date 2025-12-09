# Setting Up and Customizing Personal Ubuntu22

## What to install for Python, and how?

I recommend to manages the Python versions(and most things at the system level), using
`uv`.

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
echo -e \
  '# uv autocompletion\neval "$(uv generate-shell-completion bash)"\n' >> ~/.bashrc
echo -e \
  '# uvx autocompletion\neval "$(uvx --generate-shell-completion bash)"\n' >> ~/.bashrc

uv python install 3.10 3.11 3.12 3.13 3.14

uv python pin --global 3.14
```
