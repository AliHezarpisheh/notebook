# Inheritance

Code duplication is considered evil in all programming languages. One of the ways (that
is abused in a lot of ways) to reduce code duplication, is called **inheritance**.
Inheritance is one of the core principles of oop, which let us create `is-a`
relationships between classes.

## Concepts and Terminology

### Parent (Super) and Child (Sub) Classes

There are *parent (super)* and *child (sub)* classes. The objective of parent classes is
to abstract common logic within itself and let the child classes extend their parent
class, commonly based on specific implementation (or details).

#### What Verbs Should we Use?

A child classes derives from their parent classes or a subclass extends their
superclass.

### Attributes

An **attribute** is any name bound in a namespace that is reachable through an object
via the attribute-access protocol (`obj.name`).

#### Instance Attributes

An instance attribute is a name stored per instance, in the instance's own namespace.
You can read about attribute access in python at [Attribute Access](#attribute-access).

#### Class Attributes

## Syntax

You already know it.

```py
# Create an example yourself.
```

## Python-Specific

### object

All classes inherit from `object` by default. `object` provides a little bit of metadata
and some built-in behaviors that should be shared across all the python objects.

### Extending built-ins

One interesting feature of inheritance is extending built-in python types. This is used
for adding functionality to built-in classes.

A lot of classes we built share behavior with the default built-in classes and
especially data types. This is a great example in the `oop programming in python` book.

```py
from __future__ import annotations

class ContactList(list["Contact"]):
    def search(self, name: str) -> list["Contact"]:
        matching_contacts: list["Contact"] = []
        for contact in self:
        if name in contact.name:
        matching_contacts.append(contact)
        return matching_contacts


class Contact:
    all_contacts = ContactList()

    def __init__(self, name: str, email: str) -> None:
        self.name = name
        self.email = email
        Contact.all_contacts.append(self)

    def __repr__(self) -> str:
        return (
        f"{self.__class__.__name__}("
        f"{self.name!r}, {self.email!r}" f")"
        )
```

> ⚠️ `from __future__ import annotations` is only needed in the above example if the
> python's version is below 3.9.

### Attribute Access

Attribute access (`obj.name`) in python follows as:

1. Triggers `__getattribute__` (or `__setattr__` or `__delattr__` for mutation) which
   resolves the name through a defined lookup order:
   1. By default, the instances and their value are stored at `__dict__` (a per instance
      dictionary).
   2. Types with `__slots__` don't save attributes at `__dict__`, they store them in
      fixed C-level slots.
   3. Descriptors on the class (properties, functions, descriptor-protocol, etc) can
      intercept the lookup and compute the value dynamically.
2. `__getattr__` is used as fallback methods to access attributes that are not defined
   explicitly on the classes.

TODO: Add an example for these attribute dunder methods.
