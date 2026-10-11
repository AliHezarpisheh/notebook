# Background Tasks

You can define background tasks to get processed after the return of the response. For
small and non-critical tasks, this feature of FastAPI is useful, but for scalability and
observability, I highly suggest to use a task queue such as `celery`.

For me, the main goal of background tasks is to enhance user experience performance-wise
and let the processes that doesn't affect the response. I believe this is a good use
case of background tasks:

```py

```

## Using `BackgroundTask`

Set a parameter with `BackgroundTask` type, and voila, you have the right object now
instantiated into the parameter.

```py
from fastapi import BackgroundTasks, FastAPI

app = FastAPI()


def write_notification(email: str, message=""):
    with open("log.txt", mode="w") as email_file:
        content = f"notification for {email}: {message}"
        email_file.write(content)


@app.post("/send-notification/{email}")
async def send_notification(email: str, background_tasks: BackgroundTasks):
    background_tasks.add_task(write_notification, email, message="some notification")
    return {"message": "Notification sent in the background"}
```

You should pass a function (sync or async but async is more accepted) and its arguments
by order to the `add_task` method.

## Source Code

The code of `BackgroundTask` is so simple, take a look at it:

```py
from collections.abc import Callable
from typing import Annotated, Any

from annotated_doc import Doc
from starlette.background import BackgroundTasks as StarletteBackgroundTasks
from typing_extensions import ParamSpec

P = ParamSpec("P")


class BackgroundTasks(StarletteBackgroundTasks):
    def add_task(
        self,
        func: Annotated[
            Callable[P, Any],
            Doc(
                """
                The function to call after the response is sent.

                It can be a regular `def` function or an `async def` function.
                """
            ),
        ],
        *args: P.args,
        **kwargs: P.kwargs,
    ) -> None:
        return super().add_task(func, *args, **kwargs)
```

and this is the `StarletteBackgroundTasks`:

```py
from __future__ import annotations

from collections.abc import Callable, Sequence
from typing import Any, ParamSpec

from starlette._utils import is_async_callable
from starlette.concurrency import run_in_threadpool

P = ParamSpec("P")


class BackgroundTask:
    def __init__(self, func: Callable[P, Any], *args: P.args, **kwargs: P.kwargs) -> None:
        self.func = func
        self.args = args
        self.kwargs = kwargs
        self.is_async = is_async_callable(func)

    async def __call__(self) -> None:
        if self.is_async:
            await self.func(*self.args, **self.kwargs)
        else:
            await run_in_threadpool(self.func, *self.args, **self.kwargs)


class BackgroundTasks(BackgroundTask):
    def __init__(self, tasks: Sequence[BackgroundTask] | None = None):
        self.tasks = list(tasks) if tasks else []

    def add_task(self, func: Callable[P, Any], *args: P.args, **kwargs: P.kwargs) -> None:
        task = BackgroundTask(func, *args, **kwargs)
        self.tasks.append(task)

    async def __call__(self) -> None:
        for task in self.tasks:
            await task()
```
