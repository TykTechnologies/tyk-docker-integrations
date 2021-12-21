## Getting Started
1. Run the following command to build the go docker container: ```docker build ./integrations/custom-middleware/go-ip-based-ratelimiter/ -t go-ip-limiter-plugin```

2. Run the following command to allow go to install all the plugin dependencies: ```docker run --rm -v `pwd`/integrations/custom-middleware/go-ip-based-ratelimiter/src/:/go/ipRateLimiter/ go-ip-limiter-plugin```

3. Generate ```docker run --rm -v `pwd`/integrations/custom-middleware/go-ip-based-ratelimiter/src/:/plugin-source tykio/tyk-plugin-compiler:v3.0.8 ipRateLimiter.so```

4. Run docker-compose from the repo root using the following command `docker-compose -f docker-compose.yml -f integrations/custom-middleware/go-ip-based-ratelimiter/docker-compose.yml up`.

5. Add the following to your API definition:

```
"custom_middleware": {
  "pre": [
    {
      "name": "IPRateLimiter",
      "path": "/etc/middleware/ipRateLimiter.so",
      "require_session": false,
      "raw_body_only": false
    }
  ],
  "driver": "goplugin",
```

6. Make sure `Authentication mode` is set to `Authentication Token` and `Auth Key Header Name` is set to `Authorization` in your API.

7. Sample request: `curl localhost:8080/hello-tyk/get`
