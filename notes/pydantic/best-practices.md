# Pydantic Best Practices

## Schema Naming

It's essential to choose names that accurately reflect the model's role and
responsibility. I have my own conventions for naming schemas. I searched a lot and there
was no single established convention, so I made my own conventions.

### Convention for API-Related Schemas

**(ObjectName)(OperationName)(Request/Response)(Data/Schema)**. Here are some examples:

- *ClientRegistrationSchema*
- *UserCreationRequestData*
- *InvoiceModificationResponseSchema*

### Other Schemas

You can name other schemas that are not related to API request or response data, simply
like other classes. Some examples are:

- *Settings*
- *StartingRoom*
- *Note*
