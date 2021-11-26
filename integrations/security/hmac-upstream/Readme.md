## Getting Started
1. Run docker-compose from the repo root using the following command `docker-compose -f docker-compose.yml -f integrations/security/hmac-upstream/docker-compose.yml up`.

2. Navigate to [http://localhost:3000](http://localhost:3000) in your browser to access the Tyk Dashboard.

3. Create a new API. View Raw Definitions. Popluate the following fields under `request_signing`:
  - `is_enabled`: `true`
  - `secret`: `topsecret`
  - `key_id`: `key_id`
  - `algorithm`: `hmac-sha256`

You can read more about those setting [here](https://tyk.io/docs/release-notes/version-2.9/#hmac-request-signing)

4. Access API through Tyk Gateway. Note: you will not be able to access the API right away because it is expecting HMAC signature.
