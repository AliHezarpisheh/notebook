# Sentinel Value Pattern

It's a well-known python idiom, not a GoF pattern.
[Pep 661](https://peps.python.org/pep-0661/) proposed adding a standard `Sentinel` type
to stdlib for exactly this use case.

What's the purpose? Distinguishing "not passed" from "explicitly passed as None".

```py
class _UNSET:
    """Sentinel type indicating `http_headers` was not explicitly passed."""


class APIException(ABC, Exception):
    """Base exception for all API-related errors, handled in exception handlers."""

    http_headers: ClassVar[dict[str, str] | None] = None

    def __init__(
        self,
        message: str,
        http_headers: dict[str, str] | _UNSET | None = _UNSET,
        field: str | None = None,
        reason: str | None = None,
    ) -> None:
        """
        Initialize an `APIException` object.

        Both of the `field` and `reason` should be set, or both should be leaved unset.
        If one of them is set and the other is unset, an `ValueError` will be
        raised.
        """
        if bool(field) ^ bool(reason):
            raise ValueError("`field` and `reason` should be both set or unset")

        self.message = message
        self.field = field
        self.reason = reason
        if not isinstance(http_headers, _UNSET):
            self.http_headers = http_headers
        super().__init__(message)
```
