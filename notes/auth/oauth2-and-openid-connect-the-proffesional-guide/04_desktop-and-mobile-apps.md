# Desktop and Mobile Apps

The main questions we are going to answer in this chapter is: How can we secure
applications meant to run on our desktops or mobile devices?

## Public Clients

The public clients are the opposite of confidential clients. They can not prove their
own identity, mainly because there is no way to secure the client credentials on the
locations the applications are installed.

## Native Applications and the Browser

The native applications should provide a little window for the user's authentication to
the authorization server, a surface capable of rendering HTML.

The best practice is to use the operating system's programmatic way to invoke the
system's browser from the native application. The issue here is, this solution adds a
little bit of attack surface, meaning every attacker trying to intercept the application
and browser communication, can stole tokens and codes, and use them. There are no client
credentials here, so stealing the token means full access to whatever the client was
intended to access.

> Don't do and trust embedded web views that native applications provide. Everything
> there is under control of the application itself, so basically it can steal your
> credentials. Also, the web view is out of the browser's context, so you may loose some
> valuable features of the browsers, leading to a worse user experience.

## Meet the PKCE
