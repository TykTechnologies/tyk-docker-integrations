## Requirements
1. [ElastiCache](https://aws.amazon.com/elasticache/) Redis cluster configuration endpoint.
2. [EC2](https://aws.amazon.com/ec2/) instance with [Docker](https://www.docker.com/) installed.

**This can only be run on EC2.** Please see [Accessing ElastiCache](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/accessing-elasticache.html) for more information.

## Getting Started
1. Initilaize `REDIS_CLUSTER_CONF_ENDPOINT`, and `DASHBOARD_HOST`/`GATEWAY_HOST` with the ElastiCache Redis cluster configuration endpoint and EC2 instances public IPv4 DNS respectively by running the `scripts/init.sh` script in the repo root.
2. Run docker-compose from the repo root using the following command `docker-compose -f docker-compose.yml -f integrations/databases/elasticache-redis-cluster/docker-compose.yml up`.
3. Access Tyk on EC2 instance.

**Optional**: enable SSL on the ElastiCache communication by setting the `REDIS_USE_SSL` to `true`
