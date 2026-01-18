# Introduction to Digital Entity

The notes are written using the `Oauth 2.0 and OpenID Connect: The Professional Guide`
book by `auth0` institution.

The book and my notes should make you understand what is happening inside the oauth 2.0
and openID world. The book doesn't contain specific and detailed instructions on how to
use and implement the concepts, but it tries to make you understand why some small
details are in there and why we arrive at them, and how we arrive at them.

> Understanding the technical choices and the history behind things, will make you gain
> a professional knowledge of them. This is actually about finding out the `purpose` and
> `why`s from the critical thinking point of stand view.

Let's start. In this chapter, we are going to learn about concepts and jargons that are
essential to the identity world.

![User and Resource](./images/user-and-resource.png)

I have a resource and a user - an entity that wants to access that resource in some
capacity. So why accessing a resource by an entity becomes so complicated in the modern
era of software and security? Because a lot of things can go wrong here, and there are
the cartesian products of all these factors that come into play to determine what you
have to do to have a viable solution. Consider the following factors:

- Resource types: Previously there was a host and a central database. Now we have these
  buzz words like serverless, APIs, etc. These all point to different ways of exposing
  resources. When you are working with a computer, there is some kind of resources you
  are going to use and connect to.
- Development stack: Minor differences between development stacks that translates into
  big differences in the code you have to write to access the resources. For example,
  you would write a different code for connecting to an API using Python and C.
- Identities resources: You can have several ways to expose your identity online. You
  can be a member of social media application, or you can be an employee of a company.
  You connect to a facebook in different way you connect to an active directory. This
  adds up to the complexity. If you want to extract identity from these repositories,
  you have to find a way of doing it according to each repositories requirements.
- Client types: There are different clients for accessing resources nowadays. There are
  a lot of devices that can access resources, even our watches(smartwatches) can access
  data too! This adds up to the complexity.

> You have to use a service for the authentication and authorization, because of
> security reasons. Also, the services can abstract away the identity resources, offer
> multiple SDKs and libraries, and manage user life-cycle for you. Choose a customizable
> service.

## Open Standards

Open standards are wide agreements that have been crafted to offer common standards,
common protocols, common messages, and some common actions that should be done in the
transaction of the event. If these open standards were never made, some common actions
would be ambiguous for us now.

In identity management, I am going to touch with many protocols, but these are the most
common ones that are used nowadays:

- **OpenID Connect**: which is used for singing in.
- **Oauth 2.0**: which is the basics of openID and it is designed as an authorization
  framework to access third-party APIs.
- **JWT**: A standard token used in most of the authentication and authorization flows.
- **SAML**: Somewhat legacy(but still very much alive) protocol that is used for single
  sign-on across domains of browsers.

## Digital Identity and Its Evolution

By being exposed to a term in the right time of the history, you can understand the
concept behind it better. So, let's go through the digital identity and authentication
history and evolution, to understand them and their terms better.

We call **digital identity** the set of attributes that define a particular user in the
context of a function delivered by a particular application. What does it mean? It means
that if I am a student in university, my digital identity in the university application
is set of attributes such as my name, family name, my student id, how many lessons I
have passed, what are my scores, etc., etc. So what are my attributes in Reddit? Just a
username, that is probably fake. You see, there is no common attributes, despite me
being the same person. This shows that the digital identity relies heavily on the
context of the function delivered by the app.

> As a developer, when you are designing your user-related entities, you should pay
> attention to their attributes in the context of your application. In fact, you can use
> this for designing any entity in your system. The minimum set of attributes that are
> needed in the function of the specific task you are dealing with.

Now, a tricky question arise. How can I bring those attributes in to the context? There
is an old fashion answer for it: "Use something that the user and the resource agrees
on, such as a secret of some sort". So when the user come backs to site and demonstrates
knowledge of that secret, you say: "Ok, I know who you are". In summary, that means
grabbing a set of credentials, sending it over, and assume that you can verify the
credential. If the credentials are verified, the user is authenticated.

![Simple Auth Flow](./images/simple-auth-flow.png)

This is a simple scheme, and as such, it is very resilient. We have more advanced
technologies these days but still, the passwords are popular and they are not going
anywhere soon.

### Directories

A problem rise in the industry. A single person, having multiple user's entity in
different applications of the same organization. This makes unnecessary redundancy and
it would be a pain in the ass managing this redundancy, as like any other unnecessary
redundancies. So, industry responded with an entity named `directory`. It is a service
or a software component which centralizes functionalities related to authentication,
authorization, and user management.

The `directory` centralized credentials and attributes.

### Cross-Domain SSO

The previous solution is not scalable when you are dealing with more than one company.
The industry came up with a solution named `shadow accounts` which provisioned the user
to the resource side directly. This only makes the previous problems(before directories)
in scale.

Just like most of the solutions in the computer science industry, we created an
abstraction to solve this problem:). Some big guys sit around the table and came up with
a protocol named `SAML`, an acronym for Security Assertion Markup Language. In a
nutshell, the protocol describes a transaction which the user can sign in, in one place
and show proof in another place.

:question: :question: :question: :question: What the fuck is Cross-Domain SSO?

Here, we should introduce another concept: `trust`. We say that a resource trusts an
identity provider or an authority when that resource is willing to believe what the
authority says about its users.

#### Security Token

A security token is an artifact, a bunch of bits, used to carry tangible proofs that the
user is authenticated. They are digitally signed and contains claims about the user.

What does digitally signed means? A digital signature is something that protects bits
from tampering.

The attributes that are traveled inside the token are called `claims`. A claim is simply
an attribute packaged in a context that allows the recipient to decide whether to
believe that the user indeed possesses that attribute.
