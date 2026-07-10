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
class TokenRequestFormInput(BaseSchema):
    """Input schema for token endpoint."""

    grant_type: Annotated[GrantTypesEnum, Field(description="Grant types that are supported.")]
    scope: Annotated[str, Field(min_length=3, description="Scopes which client requested.")]


from fastapi import Form

@router.post(
    "/token",
    status_code=status.HTTP_200_OK,
)
async def grant_token(
    authorization: Annotated[str, Header(alias="Authorization", max_length=1000)],
    token_request_data: Annotated[TokenRequestFormInput, Form()],
    client_service: Annotated[ClientService, Depends(get_client_service)],
) -> dict[str, str]:
    return await client_service.grant_token(
        authorization=authorization,
        grant_type=token_request_data.grant_type,
        scope=token_request_data.scope,
    )
```

You can use pydantic features while using form models.

## File

You can define files to be uploaded by client using `File`. You would create a file
parameter the same way I would do with `Body` or `Form`.

> 💥 `File` is a class inherits directly from `Form`. I want to mention that when we
> import `File` or `Body` from fastapi, those are actually functions that return
> classes.

```py
from typing import Annotated

from fastapi import FastAPI, File, UploadFile

app = FastAPI()


@app.post("/files/")
async def create_file(file: Annotated[bytes, File()]):
    return {"file_size": len(file)}


@app.post("/uploadfile/")
async def create_upload_file(file: UploadFile):
    return {"filename": file.filename}
```

When you declare the file type as `bytes`, fastapi will try to read all the file into
the memory. This works well for small files, but for bigger files, you should use
`UploadFile`. `UploadFile` has several advantages:

- You can directly specify it as type of the param.
- It uses a spooled file. A spooled file is a file that will store its contents on
  memory up to a maximum size limit, and after that, it will store remaining data on
  disk. So, it would work well with large files.
- It provides metadata.
- It has a file-like async interface.
- It exposes an actual `SpooledTemporaryFile` object that you can pass directly into
  other libraries that expects a file-like object.

It has following attributes:

- **name**: A str which is the name of the file.
- **content_type**: A str which is the content type: `image/jpeg`.
- **file**: A `SpooledTemporaryFile` object that is actually a Python object. It has
  following async methods:
  - **read(size: int -> bytes/characters)**.
  - **write(data: bytes/str)**.
  - **seek(offset: int -> goes to the byte position)**.
  - **close()**.
  - **file -> not-async object of the file**.

> ⏲ When you await file async methods, fastapi will run them in a threadpool and awaits
> for them.

After all, you can use `UploadFile` and `File` together, for adding additional data to
the param.

```py
@app.post("/uploadfile/")
async def create_upload_file(
    file: Annotated[UploadFile, File(description="A file read as UploadFile")],
):
    return {"filename": file.filename}
```

You can also upload multiple files:

```py
@app.post("/uploadfiles/")
async def create_upload_files(
    files: Annotated[
        list[UploadFile], File(description="Multiple files as UploadFile")
    ],
):
    return {"filenames": [file.filename for file in files]}
```

## File and Form at the Same Time

You can declare both `Form` and `File` params at the same router.

```py
from fastapi import Form, File, UploadFile

@router.post(
    "/token",
    status_code=status.HTTP_200_OK,
)
async def grant_token(
    authorization: Annotated[str, Header(alias="Authorization", max_length=1000)],
    file: Annotated[
      UploadFile,
      File(
        description=(
          "I don't know why someone wants to upload a file in token endpoint=)."
        )
      )
    ],
    token_request_data: Annotated[TokenRequestFormInput, Form()],
    client_service: Annotated[ClientService, Depends(get_client_service)],
) -> dict[str, str]:
    return await client_service.grant_token(
        authorization=authorization,
        grant_type=token_request_data.grant_type,
        scope=token_request_data.scope,
        file=file,
    )
```

## A Note on HTTP Request Body Types

The request body type is declared at the `Content-Type` header. So, you already know
about JSON, but what about form data?

**HTML forms** are something that the browsers understood. Something like:

```html
<form action="login" method="post">
  <input name="username" value="ali">
  <input name="password" value="123">
  <button type="submit">Login</button>
</form>
```

Browser will read the form, and encode it in a body request with
`application/x-www-form-urlencoded` like this:

```txt
username=ali&password=123
```

So the `<form>` tag tells the browser when user submits the form, you should make a HTTP
request. For the example above, after submitting, browser will do a `POST {{url}}/login`
with the body I specified above.

JSON was created after browsers, so, this is the old fashion way for sending key-value
pairs, and it is still used because of several reasons.
