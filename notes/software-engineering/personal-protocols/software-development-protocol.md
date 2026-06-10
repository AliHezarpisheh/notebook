# Development Protocol

This page is written by myself, for myself, to have clear guides and instructions on how
I should start, develop, extend, refactor, and maintain a code-base. I try to put the
general guides, rules, and instructions, applied to all languages and frameworks.

For every related programming language, I will have dedicated pages that I will specify
tools, idiomatic ways to make the rules done, or even new rules!

This document must get updated so rules could be changed, added, modified, or get
deleted. Also, the tools, languages, and frameworks should constantly get updated.

## Static Code Analysis Tools

### Use Linters, Formatters, Type Checkers, and Code Security Analysis Tools

Setup an ecosystem that could contain shell scripts, static analysis in CI/CD pipelines,
pre-commit hooks (which I explained below), etc. The static analysis and formatting is a
must for the code bases you maintain.

### `scripts/` Directory.

Pack the Commands inside shell scripts in the `scripts/` directory.

### Use pre-commit

This is crucial. I have nothing to say except this.

## Package Managers - Manage Dependencies by Conventional and Modern Package Managers

### Split Dependencies to Dependency Groups

Usually, I have `main`, `development`, and `testing` dependency groups. Depends on the
project, these can be added, modified, or removed(better not to mix these three!).

### Use Lock Files

This is a must.

## Git - This is Obvious

### Git Itself

Track changes in your code base with git, and ultimately, use a remote repo.

> 🙈 Always include a `.gitignore` at your project's root.

## Settings, Configuration, and Environment

### Create a `settings.toml` File for Public and Environment-Agnostic Configuration

Use `settings.toml` to put logging configuration, openapi configuration, and such public
settings.

### Use .env.{ENVIRONMENT_NAME} For Managing Environment-Related Configuration

Usually I have `.env.development`, `.env.testing`, and `.env.production` env files, but
depends on the project or organization, I may include others(e.g. `.env.uat`).

> 📑 Create `.env.{ENVIRONMENT_NAME}.example` files to give a clue to other developers
> what should they contain in their `.env` files.

### ⚠ TODO: What Should I Use for Passwords, Keys, and Secrets?

I believe there are safer mechanism to store secrets and sensitive configuration. I have
heard of `Docker Secrets` or `AWS Vaults` but haven't properly engaged with those. I
should find the optimal solution for managing passwords and secrets.

### Use Proper and Modern Tools to Connect Your Code and Configuration

Use libraries and frameworks to bring your env variables and configurations to the app's
memory.

## Documentation - No, Don't Run From It!

### `docs/` Directory

Write Documents and Store them at `docs/`. The documentations could be about database,
API, security, architecture, etc.

### Use Automate Document Generation Tools

Don't do all of the work here by your hands. Use libraries and frameworks, like `sphinx`
or `fastapi openapi stuff` to generate documents for you.

## Architecture

A defined architecture in every level of the software is necessary. Here I am more
focusing on the architectural patterns of the code base.

### Define a Base Architecture and Directory Model

Givin an example here can illustrate things better. So developing fastapi projects, I
usually have *models, repository - consisting of data access layer, business logic
layer, and service layer, schemas, and routers*. These are necessary for the project's
maintainability and scalability.

By saying that I have to define a base architectural pattern for the code base, I mean
define the layers clearly and stick to it, unless a change is needed, also be flexible
when the change is needed.

### Have a Central Place for Storing General Purpose Utilities

That's it. I usually have a `toolkit` directory at the root of the project, containing
general utilities that are not thighed to any business logic.

## Testing - The Inevitable

### Always Write Unit and Integration Tests for the Code Base

This is a must. If a code base doesn't have tests, start writing those, no matter how
hard or complicated it gets. If it has tests, try to expand them, refactor them, and
enhance it generally.

### Add Tools to Test Your Code in Different Environments

Do it only when needed.

## Dockerize - Don't be Lame and Old!

Always create a `Dockerfile` for the project. ALWAYS. Make sure that you adhere docker
and containerization best practices(including .dockerignore, multi-stage builds, etc).
Use `docker-compose.yml` if the project need it for local deployment(the project
probably needs it).
