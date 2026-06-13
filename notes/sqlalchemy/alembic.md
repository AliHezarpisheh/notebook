# Alembic

A database migration tool built for projects that use sqlalchemy. **A migration tool is
a tool which tracks and maps the database schemas, tables, columns, and other database
objects changes from your code and apply it to the database**. Alembic and other
migration tools are designed with a version-controlled approach, giving the ability to
rollback to the previous versions of the db if necessary.

## Installation and Configuration

Install and configure alembic:

```bash
ali> uv add alembic
ali> alembic init alembic  # For not-async projects.
ali> alembic init -t async alembic  # For async projects.
```

Then go to `alembic.ini` and comment out the `sqlalchemy.url`, and add the following
code to the `alembic/env.py`:

```py
from app.oauth2.models import *

from config.base import settings
from toolkit.database import Base

# this is the Alembic Config object, which provides
# access to the values within the .ini file in use.
config = context.config

# Set the database url
config.set_main_option("sqlalchemy.url", settings.database_url)

# add your model's MetaData object here
target_metadata = Base.metadata
```

So, remember:

1. Import the models class in the `models/__init__.py` and make sure that all are
   present in the `alembic/env.py`.
2. Set the database url and comment it out in the `alembic.ini`.
3. Set the `target_metadata`.

## Do the Migrations

To make a migration file which includes changes automatically you should:

```bash
alembic revision --autogenerate -m "A message indicating the changes"
```

To create an empty revision:

```bash
alembic revision -m "A message indicating what you want to do"
```

For upgrading to the latest revision:

```bash
alembic upgrade head
```

For downgrading to the previous revision:

```bash
alembic downgrade -1
```

## My Conventions

Conventionally, I put the `alembic/` directory into the `config/`.
