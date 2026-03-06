# Single Page Applications

## What is a Single Page Application?

Single page applications ask for a single page from the server, containing all the
visual elements and a lot of JavaScript to reach out to the server to ask for the data
every time it needed it.

## What Flows are Used for SPAs?

So the industry came up with the `Implicit Flow with Fragment` at first.

In the implicit grant with post form, we obtain tokens in the page's body. In the
implicit grant with fragment, the token travels inside the fragment element in the URL.

> Implicit grant receives the token from the authorization endpoint directly, instead of
> asking it from the token endpoint.

The flow was not secure for several obvious reasons. The community should come up with a
more secure approach, this is why we use authorization code flow with pkce for the SPAs
applications nowadays.

> I suggest you to check `Token-Meditating Back-end` and `Back-end for Front-end`
> patterns.

## The End - Some Considerations

This is the end of the book, and gosh I don't why but this topic was so complicated for
me! This folder was created to take notes of the `Oauth 2.0 and OpenID Connect` book,
but I have added several more notes to it, gathered from different places and my
experience trying to implement an oauth 2.0 server:) I haven't done it when I am writing
this text but as soon as the internet in my country goes up again, I will start learning
and doing more.
