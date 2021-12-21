```docker build ./integrations/custom-middleware/go-ip-based-ratelimiter/ -t go-ip-limiter-plugin```

```docker run --rm -v `pwd`/integrations/custom-middleware/go-ip-based-ratelimiter/src/:/go/ipRateLimiter/ go-ip-limiter-plugin```

```docker run --rm -v `pwd`/integrations/custom-middleware/go-ip-based-ratelimiter/src/:/plugin-source tykio/tyk-plugin-compiler:v3.0.8 ipRateLimiter.so```
