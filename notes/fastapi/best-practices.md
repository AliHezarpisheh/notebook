# FastAPI Best Practices

Opinionated list of best practices and conventions I try to use in my FastAPI projects.

## Project Structure

The best structure is one that is consistent, straightforward, and free of surprises. I
find the `layered architecture` not scalable and very ambiguous, compare to
`modular/ ddd architecture`. For more details you can checkout
[My Software Engineering Protocols](../software-engineering/personal-protocols/software-development-protocol.md)
This is an example of what my project structure looks like:

Below is an ex

```txt
.
├── app
│   ├── account
│   │   ├── auth
│   │   │   ├── api
│   │   │   │   ├── dependencies
│   │   │   │   ├── __init__.py
│   │   │   │   └── routers
│   │   │   ├── helpers
│   │   │   │   ├── enums.py
│   │   │   │   ├── exceptions.py
│   │   │   │   └── __init__.py
│   │   │   ├── __init__.py
│   │   │   ├── models
│   │   │   │   ├── activity_log.py
│   │   │   │   ├── __init__.py
│   │   │   │   ├── permission.py
│   │   │   │   ├── profile.py
│   │   │   │   ├── role_permission.py
│   │   │   │   ├── role.py
│   │   │   │   ├── token.py
│   │   │   │   ├── user.py
│   │   │   │   └── user_role.py
│   │   │   ├── repository
│   │   │   │   ├── bll
│   │   │   │   ├── dal
│   │   │   │   ├── __init__.py
│   │   │   │   └── services
│   │   │   ├── schemas
│   │   │   │   ├── __init__.py
│   │   │   │   ├── token.py
│   │   │   │   └── user.py
│   │   │   └── security.py
│   │   ├── __init__.py
│   │   └── otp
│   │       ├── api
│   │       │   ├── dependencies
│   │       │   ├── __init__.py
│   │       │   └── routers
│   │       ├── helpers
│   │       │   ├── enums.py
│   │       │   ├── exceptions.py
│   │       │   └── __init__.py
│   │       ├── __init__.py
│   │       ├── repository
│   │       │   ├── bll
│   │       │   ├── dal
│   │       │   ├── __init__.py
│   │       │   └── services
│   │       ├── tasks
│   │       │   ├── email.py
│   │       │   └── __init__.py
│   │       └── templates
│   │           └── otp_email.html
```

I also have more top-level modules like `config` and `toolkit`.

## FastAPI is an Async Framework, So Use Async Routers, or Let Routers Run in Threadpool

The title says it all, DON'T BLOCK THE EVENT LOOP.

> 💡 Favor `run_in_threadpool`.

## Use Pydantic Excessively

It is such a cool and powerful tool, try to use it as much as you can. Also:

- **Create a `BaseModel` to encapsulate base formats and features.**
- **Use multiple `BaseSettings`.**

## Utilize Dependencies

Favor `async` dependencies over `sync` dependencies. Also, dependencies let you write
more.

## FastAPI Response Serialization

**Don't return Pydantic models as response for routers.** FastAPI would serialize the
response twice. I prefer returning a `dict` object, that should get validated with the
Pydantic model in the `response_model` param.

## Use `BackgroundTask` wisely

| Use `BackgroundTask` when ...                | Use `Celery/Arq/RQ` when ...            |
| -------------------------------------------- | --------------------------------------- |
| The task is short (< 1s).                    | The task is long (> 1s).                |
| Failure is okay and can silently be dropped. | Retries or dead-letter handling needed. |
| You don't need scheduling and rate-limiting. | You need scheduling and rate-limiting.  |

> 🍡 The `BackgroundTask` will continue in the same worker process.

## OpenAPI Doc

Hide it in the production, unless the API is public. Also, help FastAPI to generate more
comprehensive documents.

```py
from fastapi import APIRouter, status

router = APIRouter()

@router.post(
    "/endpoints",
    response_model=DefaultResponseModel,  # default response pydantic model
    status_code=status.HTTP_201_CREATED,  # default status code
    description="Description of the well documented endpoint",
    tags=["Endpoint Category"],
    summary="Summary of the Endpoint",
    responses={
        status.HTTP_200_OK: {
            "model": OkResponse, # custom pydantic model for 200 response
            "description": "Ok Response",
        },
        status.HTTP_201_CREATED: {
            "model": CreatedResponse,  # custom pydantic model for 201 response
            "description": "Creates something from user request",
        },
        status.HTTP_202_ACCEPTED: {
            "model": AcceptedResponse,  # custom pydantic model for 202 response
            "description": "Accepts request and handles it later",
        },
    },
)
async def documented_route():
    pass
```

## SQL First, Pydantic Second

Usually, database handles data processing much faster and clearer than CPython do.

## Use Async Client for Tests

Using sync client will result in messy event loop errors, set that `httpx` up from day
0\.

## Replace Dependencies in Tests

Use `app.dependencies_override`.
