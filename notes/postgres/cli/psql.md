# PSQL Cli Tool

This is the official cli tool for PostgreSQL.

## Connecting

```bash
psql -U username -d database_name -h 192.168.1.1 -p 5432

psql postgresql://user:password@192.168.1.1:54321/db_name
```

## Back-slash Commands

These are psql-specific commands, no sql here:

| Command         | What it does                                    |
| --------------- | ----------------------------------------------- |
| `\l`            | list all databases                              |
| `\c dbname`     | connect to a different database                 |
| `\dt`           | list tables in current schema                   |
| `\d tablename`  | describe a table (columns, types, indexes, FKs) |
| `\d+ tablename` | describe with extra detail (size, storage)      |
| `\dn`           | list schemas                                    |
| `\du`           | list users/roles                                |
| `\di`           | list indexes                                    |
| `\df`           | list functions                                  |
| `\dT`           | list data types                                 |
| `\dT+`          | list data types with additional info            |
| `\dT oauth2.*`  | list data types in `oauth2` schema              |
| `\x`            | toggle expanded display (great for wide rows)   |
| `\timing`       | toggle showing query execution time             |
| `\q`            | quit                                            |
| `\?`            | help with all backslash commands                |
| `\h SELECT`     | SQL syntax help for a specific command          |

## SQL

Write sql as you always do, but don't forget to put `;` after them.
