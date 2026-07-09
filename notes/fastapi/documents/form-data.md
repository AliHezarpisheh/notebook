# Form Data

If you need to receive form fields instead of JSON fields you should use `Form`.

```bash
uv add python-multipart  # Dependency
```

## `Form` Param

You should use `Form` similar to `Query`, `Header`, and `Body`.

```py
@router.post(
    "/token",
    status_code=status.HTTP_200_OK,
)
async def grant_token(
    authorization: Annotated[str, Header(alias="Authorization", max_length=1000)],
    grant_type: Annotated[str, Form()],
    scopes: Annotated[str, Form()],
    client_service: Annotated[ClientService, Depends(get_client_service)]
) -> dict[str, str]:
    return await client_service.grant_token(
        authorization=authorization,
        grant_type=grant_type,
        scopes=scopes,
    )
```

Data from is normally encoded using the media type `application/x-www-form-urlencoded`,
but when it include files, it is encoded as `multipart/form-data`.

> ⚠ Obviously, you can not use JSON and Form bodies together, the HTTP request body can
> only have **one** content type.

## Form Models

You can use pydantic models to declare form fields.

```py

```
