# Dictionary

## Ordering

As of Python 3.7, insertion-order preservation is a language-guarantee for `dict`, not a
CPython implementation detail, and it is part of the spec. So no use of `OrderDict` is
needed anymore.
