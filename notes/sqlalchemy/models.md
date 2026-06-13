# Models

Here I am gonna document out everything I learn and should do while creating and
managing SQLAlchemy models.

## `default` vs `server_default`

`default` uses a constant or calls a callable and generates the value on the Python side
so it is completely invisible to the database. Its characteristics are:

- A database *INSERT* statement won't generate the default outside of the application's
  logic and code.
- It pins to Python's process time not the database server clock.
- You don't need to refresh your object after doing an insert or update to obtain the
  new value.

On the other side, `server_default` is a sql text or sqlalchemy function, which
generates the default on the database level.

```py

```
