# Python Docstrings

Python docstrings are string literals that show information regarding Python functions,
classes, methods, and modules. Their use and convention are described in
[pep 257](https://peps.python.org/pep-0257/).

So, one of the main purposes of writing docstrings, is to have a clear and precise
explanation of the code's purpose, parameters, and output. So, the main question is not
`how does it work?`, instead, we should aks `Why does it exist?`, `what's the purpose?`,
or at least, `what does the code do?`. Ultimately, the docstring should answer the
questions that a developer reading the code might have.

> ⚠ Docstrings serve different purpose compared to comments. Comments are used to write
> reminders for other developers, where the docstrings are used for documenting tools
> for users of that software component. **Comments are better for explaining
> implementation details, contrast to docstrings.**

## Classification

We have **one-line** and **multi-line** docstrings. Their titles are pretty
self-explanatory. We usually use one-line docstrings for more straight forward
components, while we use multi-line docstrings when we feel that we need to explain more
about our component

A docstrings should usually include a summary, parameters, and return values of a
function/method.

## How Interpreter Treat Docstrings?

Unlike comments, Python interpreter doesn't ignore the docstrings, instead, it store it
inside the `__doc__` attribute.

Also, for more information than docstring, having an interactive experience, you can use
the built-in `help()` function.

## Conventions and Styles

Following a structure in writing docstrings can save a lot of mental capacity. These are
the common most styles:

- **reStructuredText docstrings**.
- **Google-style docstrings**.
- **NumPy-style docstrings**.
- **Doctest-style docstrings**.

Currently, while writing this documentation, I've been using `numpy-style` docstrings
for years. **Stay consistent with your style**.

## Levels

### Module

When you write docstring for modules, the goal is to provide high-level overview of the
module. Ultimately, you can add more description, or even make examples, to help the
users understand more.

### Functions and Methods

A good function docstrings should explain what does the function, what's it purpose, and
provide details about parameters, return value, exceptions, side effects, constraints,
and invariants.

### Classes

Explain class generally, considering the practices I've already told, and you can add
some explanations about attributes and methods.

## Best Practices

- The first line of docstrings should be in imperative mode.
- Use one style for the entire project.
- Use linters to check docstring rules.
- **Don't explain technical implementation details of the component in the docstring!**
- Don't provide vague explanations.

## Tools

`Sphinx` and `pydoc` are two of the most known tools for creating tangible outputs and
pages from the docstrings.

## The Prompt for Generating Docstrings

```txt
## Instructions

Write numpy-style docstrings, with maximum 88 characters at each line, having an actual
single-line explanation for the first line.

## Considerations

- Don't answer to `how does it work`, instead answer to `why does it exists`, `what's
the purpose?`, or at least `what does the code do?`.
- Mention constraints or assumptions in the input. Include type hints, but don't repeat.
- Describe the meaning of the return value, not just its type. Example: Return the
  maximum number of edges from the node to any leaf.
- Explain side effects if exists.
- Include invariants if present.
- Include non-obvious or edge-case behavior.
- Don't include implementation details.
- **Don't modify the code.**

## Guides

- Write one-line docstrings for modules and classes, and write multi-line docstrings for
  functions and methods.
```
