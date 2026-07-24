# SQLAlchemy Best Practices

## Use `back_populates` instead of `backref`

In [Documentation](https://docs.sqlalchemy.org/en/14/orm/backref.html), it suggests that
we should use explicit `relationship()` in both classes, instead of implicit `backref`.
