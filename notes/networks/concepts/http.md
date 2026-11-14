# Learning HTTP by Networking Perspective

HTTP is the foundation of the World Wide Web's. HTTP is used to send requests and
receive documents and data such as HTML documents and JSONs from APIs, from servers to
the clients.

HTTP is an OSI layer 7 (Application) protocol and DOD layer 4 (Application) protocol. It
operates on top of other layers of the network protocol stack to convey data between
network devices (typically a client and a server).

## Web Server

A web server is a program running a HTTP daemon, which listens to HTTP requests, and
respond using HTTP responses. Example of HTTP web servers are Nginx and uvicorn. When a
client wants to see a web page, or a client wants to fetch some data from the server,
the browser builds a HTTP request and sends it to the IP address pointed by the URL. The
request is received by the HTTP server daemon on the destination server, processed, and
the response is sent by the web server back to the client.

## HTTPS

HTTPS uses SSL as a sub-layer on HTTP. HTTPS encrypts and decrypts user requests and web
server's responses.

## Components

There is a **client** (browsers, postman, curl) and a **server** (a process on the
network with http ports open and a web server running on the port), and there are
**proxies** between client and server. Proxies can also be different components such as
**gateways** and **cache**.

## History

### HTTP/0.9

The first version of HTTP. At first, it has no versions, and the version came after next
HTTP versions. This version is also known as `the one-line protocol`, because every
request only comes in one-line.

```http
GET /hello.html
```

The response also includes a file and nothing else, there are no headers and status
code.

```http
<HTML>
Hello World!
</HTML>
```

### HTTP/1.0

In this version, the HTTP's version will be sent in the request along the URL, and the
status code is sent in the response. Here, the client will open a tunnel to the server
and sends the request content in plain text. A single connection will be established for
each request.

```http
GET /TheProject.html HTTP/1.0
```

```http
HTTP/1.0 200 OK
 Date: Fri, 08 Aug 2003 08:12:31 GMT
 Server: Apache/1.3.27 (Unix)
 MIME-version: 1.0
 Last-Modified:  Fri, 01 Aug 2003 12:45:26 GMT
 Content-Type: text/html
 Content-Length: 2345
   ** a blank line *
   <HTML> ... </HTML>
```

### HTTP/1.1

Very similar to HTTP/1.0, but persistent connections are introduced. In this version, a
single connection could be used for several request and response cycles.

### HTTP/2.0 and Above

HTTP/2.0 begins as a SPDY protocol. A single TCP channel is established between the
client and the sever here.

==TODO: Read more on HTTP/2.0.==

### HTTP/3.0

==TODO: Read on HTTP/3.0.==
