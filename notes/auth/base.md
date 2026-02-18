# Previous Notes on the Topic

## Authentication

Authentication is the process of verifying the identity of a user or system. It ensures
that the entity is who it claims to be.

### What are Credentials

Information provided by the user to prove their identity. It could be in form of a:

- Something user knows: Passwords.
- Something user owns: Tokens.
- Something user is: Biometrics.

There are two main authentication methods:

- Single-Factor Authentication. -> One category of credentials.
- Multi-Factor Authentication. -> Multiple categories of credentials. You can use
  `sms-based otp`, `email-based otp`, `authenticator apps`, `push notifications`,
  `biometric`, and `hardware token` for that.

We have multiple types of authentication:

- Password Based.
- Token Based.
- Biometric Based.
- Certificate Based.
- Single Sign-on.
- OID Connect.

### What is an OTP?

A one time password is a type of password that is valid for only one logging session.

- TOTP: Time-based one time password.
- HOTP: HMAC-based one time password.

A moving factor plus a secret would create the otp.

### What is a Session?

A session is a way to maintain stateful interaction between a client and a server across
multiple HTTP requests.

> Favor sessions security and performance.

### What is a Token-Based Authentication?

A modern approach for authenticating users in a web application and APIs, consist using
of a token, representing the digital identity of the user.

**Token:** A string of character's representing user's authentication and authorization
information. Whoever possess it, can access the associated resources.

#### JWT

Json Web Token is an open standard that defines compact and self-contained way for
securely transmitting information between parties as JSON objects. It consists of:

- Header: Contains the data about the token including signing algorithm and token type.
- Payload: Contains claims about the user.
- Signature: Encrypted string, used by the combination of the header and payload, plus
  the secret key.

Signing token with a secret key ensures the authenticity and integrity of the token.
This makes sure that the token is not tampered with and it was indeed issued by a
trusted source.

> An opaque token is just a random set of strings without any meaningful data.

## Authorization

It is the process of determining what an authenticated user is allowed to do. Let's
learn some important concepts:

- Access Control: The mechanism to restrict access to resources based on policies.
- Permissions: Specific rights to perform actions on resources.
- Roles: Grouping permissions to simplify the assignment of access to rights.

There are three main ways we could implement our authorization model:

- Role-Based Access Control(RBAC).
- Attribute-Based Access Control(ABAC).
- Policy-Based Access Control(PBAC).

### Oauth 2.0

Oauth 2.0 is an open standard for authorization in cases where a third-party app want a
delegated access on behalf of the user to a service. It focuses on keeping user
credentials secret to themselves and the resource server, and giving limited access to
the third-party.

There are multiple grants in oauth 2.0 framework:

- Authorization Code Grant: Web and mobile apps, the canonical use case.
- Implicit Grant: SPAs.
- Resource Owner Password Credentials Grant: Trusted clients.
- Client Credentials Grant: Machine-to-machine communication.
- Refresh TOken Grant.
