# Oauth 2.0 and OpenID Connect

Oauth 2.0 and OpenID Connect are HTTP and JSON based.

> Oauth 2.0 and OpenID Connect heavily relies that everything is occurring on a secure
> channel.

The thing is, these protocols and specifications are not the developers job to master. I
mean sure, if you are an identity expert, you should master it. If you are writing one
of these specifications, you should master it. Are you? Are you gonna be an identity
expert right now and focus most of your time on it? If the answer is no, always use
services like auth0 and keycloak to handle the auth for you. But implementing a oauth
server could be fun:), and it shouldn't be for production. So don't stop learning by
implementing them, and accept the fact that they could not be perfect. It's ok, we have
another way to make things go near perfect in the authentication and authorization
scenarios.

## Oauth 2.0 Roles

As you should know from the critical thinking skills, one of the thinking's elements is
`concepts`. Without concepts, we can not understand the text we are reading or the
speech of another person. So, let's talk about oauth 2.0 concepts. First, let's observe
the actors:

- **resource owner**: The resource owner, is quite simply, the user. The one who
  possesses the resource wanted to be accessed.
- **resource server**: Resource owner is the guardian of the resource, it is whatever is
  protecting other services to access the resources of the users without their
  permission.
- **client**: The application that needs to obtain access to the resources.
- **authorization server**: It is where the authorization and token endpoints are served
  used for driving the delegated authentication scenarios described in previous season.

## Oauth 2.0 Grants

Grants are set of steps clients uses to obtain some kind of credentials from the
authorization server, for the purpose of accessing the resources. This grants are
created because of different ways suitable for different type of clients to connect to
the authorization servers in their own ways, according to their specific peculiar
security guarantees. Oauth 2.0 standard officially introduced **Authorization Code**,
**Implicit**, **Resource Owner Credentials**, **Client Credentials**, and **Refresh
Token**. The OpenID Connect introduced another grant named **Hybrid**.
