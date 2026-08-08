# Python Security Best Practices

## Generating Random Secrets

Don't use `random` because its not cryptographically safe, and don't use `uuid.uuid4()`
because it would give less entropy than what I want, and it is not designed for this.

You should use `secrets` components.

```python
secret = secrets.token_urlsafe(32)
```

This generates random 32 bytes (256 bits of entropy) and base64url-encodes them.
`secrets` pulls from os.urandom that is actually unpredictable, unlike
`Mersenne Twister`-based `random`.
