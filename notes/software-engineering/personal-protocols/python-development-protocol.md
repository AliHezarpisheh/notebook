# Python Development Protocol

This is additional and complement of the
[Software Development Protocol](software-development-protocol.md), specifying Pythonic
ways and tools.

## Use ruff and isort for Code Linting and Formatting

Use `ruff` as your linter and formatter. Also you can use `mdformat` for formatting
markdown files.

The latest configuration should be kept at `fastapi-kit` repo, in the `pyproject.toml`
file.

> 🔊 Don't forget to use pre-commit.

## Mypy, Make Sure the Code is Type Safe (You Can't Make Sure but Try!)

Using mypy and having no errors is a must for Python projects especially the back-end
ones.

## Write Docstrings

Ok this is one of the controversial decisions I've made and I received a lot of
disagreements. Docstrings are super beneficial in modern Python development and if there
is no reasonable reasons to avoid them, WRITE THOSE.

## Add Your Own Error Handling Mechanism

If needed, which is probably needed, you should develop your own error handling
mechanism and create your custom exceptions.

## Use `abc.ABC` or `typing.Protocol` for Type Safety and OOP Rules and Patterns

Don't overuse or misuse those, but they are great tools to reach type safety and adhere
some oop rules that are not forced in Python.

## Use `Enums` for Static and Finites Messages and Constants

The header is clear.

## Use uv as Package Manager

Currently, you should use and integrate `uv` within every Python project you're working,
unless you have specific reasons not to use it. Using `poetry` is also another option,
but I favor using `uv` due to its speed and convenience.

Use `pip` and its related tools only for compatibility reasons.

## Settings

The best library here is `pydantic-setting`. Absolutely love it! I have some
customization on it so it could read both `env` files and the `settings.toml` file. The
`BaseSetting` child should be the single source of the configuration.

## Testing - The Inevitable

### Unit and Integration Testing

Use `pytest` and its extensions for unit and integration testing, it has almost
everything you need.

### Performance Testing

`locust` is an absolute beast here. Use it.

### Add Tools to Test Your Code in Different Environments

Use `tox` or `uv` (I suggest uv at the time writing the page) to test the project in
different versions of Python and packages.
