# Python Development Protocol

This is additional and complement of the
[Software Development Protocol](software-development-protocol.md), specifying Pythonic
ways and tools.

## Static Code Analysis Tools

### Use Linters, Formatters, Type Checkers, and Code Security Analysis Tools

Use `ruff` as your linter and formatter, and `mypy` as your static typing analysis tool.
Also use `mdformat` for formatting markdown files.

The latest configuration should be kept at `fastapi-kit` repo, in the `pyproject.toml`
file.

> 🔊 Don't forget to use pre-commit.

## Package Managers - Manage Dependencies by Conventional and Modern Package Managers

Currently, you should use and integrate `uv` within every Python project you're working,
unless you have specific reasons not to use it. Using `poetry` is also another option,
but I favor using `uv` due to its speed and convenience.

Use `pip` and its related tools only for compatibility reasons.

## Settings, Configuration, and Environment

The best library here is `pydantic-setting`. Absolutely love it!

## Testing - The Inevitable

### Unit and Integration Testing

Use `pytest` and its extensions for unit and integration testing, it has almost
everything you need.

### Performance Testing

`locust` is an absolute beast here. Use it.

### Add Tools to Test Your Code in Different Environments

Use `tox` or `uv` (I suggest uv at the time writing the page) to test the project in
different versions of Python and packages.
