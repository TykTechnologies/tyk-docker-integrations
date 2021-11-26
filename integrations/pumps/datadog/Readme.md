## Requirements
1. [Datadog](https://www.datadoghq.com/) API key.

## Getting Started
1. Initilaize `DATADOG_API_KEY` by running the `scripts/init.sh` script in the repo root.
2. Run docker-compose from the repo root using the following command `docker-compose -f docker-compose.yml -f integrations/pumps/datadog/docker-compose.yml up`.
3. Navigate to [https://www.datadoghq.com](https://www.datadoghq.com/) in your browser to view your analytics.
