#!/bin/bash

# VERSION
CRAWLER_VERSION=0.2.10-SNAPSHOT
CONSUMER_VERSION=0.3.8-SNAPSHOT
REWARD_VERSION=0.1.6
SCHEDULE_VERSION=0.2.8
API_VERSION=0.3.21
AUTHENTICATION_VERSION=0.1.6
FRONTEND_VERSION=0.4.9

# POSTGRESQL
POSTGRES_HOST=explorer-postgres
POSTGRES_EXTERNAL_PORT=5432
POSTGRES_EXTERNAL_HOST={MY_IPV4}
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=explorer
POSTGRES_DATA_DIR=./data/postgres/explorer

# POSTGRESQL AUTH
AUTH_POSTGRES_HOST=explorer-auth-postgres
AUTH_POSTGRES_EXTERNAL_PORT=54321
AUTH_POSTGRES_EXTERNAL_HOST={MY_IPV4}
AUTH_POSTGRES_USER=postgres
AUTH_POSTGRES_PASSWORD=postgres
AUTH_POSTGRES_DB=explorer-auth
AUTH_POSTGRES_DATA_DIR=./data/postgres/explorer-auth

# KAFKA & ZOOKEEPER
KAFKA_EXTERNAL_PORT=9092
# TODO: change to your ipv4 address
KAFKA_EXTERNAL_HOST={MY_IPV4}
KAFKA_LOCALHOST_PORT=9094
KAFKA_LOCALHOST_HOSTNAME=localhost
KAFKA_INTERNAL_PORT=9093
KAFKA_INTERNAL_HOST=explorer-kafka
KAFKA_DATA_DIR=./data/kafka

ZOOKEEPER_HOSTNAME=explorer-zookeeper
ZOOKEEPER_PORT=2181
ZOOKEEPER_DATA_DIR=./data/zookeeper/data
ZOOKEEPER_LOG_DIR=./data/zookeeper/log

# REDIS
REDIS_MASTER_HOST=explorer-redis-master
REDIS_MASTER_PORT=6379
REDIS_MASTER_PASSWORD=redis

REDIS_SLAVE_HOSTNAME=explorer-redis-slave
REDIS_SLAVE_PORT=6380
REDIS_SLAVE_PASSWORD=redis

REDIS_SENTINEL_EXTERNAL_PORT=26379
REDIS_SENTINEL_EXTERNAL_HOST={MY_IPV4}
REDIS_SENTINEL_HOST=explorer-redis-sentinel
REDIS_SENTINEL_PASSWORD=redis
REDIS_MASTER_SET=explorer
REDIS_SENTINEL_DATABASE=0

# MINIO
MINIO_HOSTNAME=explorer-minio
MINIO_CONSOLE_PORT=9001
MINIO_API_PORT=9000

MINIO_ACCESS_KEY=minio
MINIO_SECRET_KEY=minio_secret_ne
MINIO_DATA_DIR=./data/minio
MINIO_ROOT_USER=root
MINIO_ROOT_PASSWORD=root_secret_ne

# Crawler
CRAWLER_HOSTNAME=explorer-crawler
CRAWLER_PORT=8765
CRAWLER_SPRING_PROFILES_ACTIVE=n2n,sentinel,kafka
CRAWLER_NAME=mainnet-crawler
CRAWLER_BLOCKS_TOPIC=mainnet.crawler.blocks
BLOCKS_ROLLBACK_TOPIC=mainnet.crawler.blocks.rollback
CRAWLER_ENVIRONMENT=mainnet
CRAWLER_NETWORK_MAGIC=764824073

CRAWLER_NODE_ADDRESS=10.4.10.231
CRAWLER_NODE_PORT=3004

# Consumer
CONSUMER_HOSTNAME=explorer-consumer
CONSUMER_PORT=8766
CONSUMER_SPRING_PROFILES_ACTIVE=dev,redis-sentinel,caching
CONSUMER_SCHEMA=mainnet
CONSUMER_NETWORK=764824073
CONSUMER_LOG_LEVEL=DEBUG

CONSUMER_BLOCKS_BATCH_SIZE=1000
CONSUMER_COMMIT_THRESHOLD=3000
CONSUMER_JDBC_BATCH_SIZE=1000
CONSUMER_FLYWAY_ENABLE=true
CONSUMER_MAXIMUM_POOL_SIZE=80
CONSUMER_FILE_GENESIS_PATH=/genesis/
CONSUMER_FLYWAY_VALIDATE=false
CONSUMER_ALLOW_CREATE_SCHEMA=true
CONSUMER_SUBMIT_API_CONFIG_URL=/genesis/mainnet/submit-api-config.json
CONSUMER_BYRON_GENESIS_URL=/genesis/mainnet/byron-genesis.json
CONSUMER_SHELLEY_GENESIS_URL=/genesis/mainnet/shelley-genesis.json
CONSUMER_ALONZO_GENESIS_URL=/genesis/mainnet/alonzo-genesis.json
CONSUMER_CONWAY_GENESIS_URL=/genesis/mainnet/conway-genesis.json

# Reward
REWARD_HOSTNAME=explorer-reward
REWARD_PORT=8767
REWARD_SPRING_PROFILES_ACTIVE=local,koios
REWARD_SCHEMA=mainnet
REWARD_NETWORK=mainnet

REWARD_LIST_SIZE_EACH_THREAD=5
REWARD_POOL_INFO_LIST_SIZE_EACH_THREAD=500

REWARD_POOL_MAX_SIZE=12
REWARD_POOL_CORE_SIZE=10

REWARD_FLYWAY_ENABLE=true
REWARD_FLYWAY_VALIDATE=false

REWARD_PARALLEL_SAVING_ENABLED=true
REWARD_SUB_LIST_SIZE=500
REWARD_PARALLEL_SAVING_THREAD_NUM=10
REWARD_EPOCH_STAKE_PARALLEL_SAVING_ENABLED=true
REWARD_EPOCH_STAKE_SUB_LIST_SIZE=500
REWARD_EPOCH_STAKE_PARALLEL_SAVING_THREAD_NUM=10
REWARD_REWARD_LIST_SIZE_EACH_THREAD=5
REWARD_EPOCH_STAKE_LIST_SIZE_EACH_THREAD=5

REWARD_POOL_INFO_DATA_JOB_ENABLED=true
REWARD_FETCH_AND_SAVE_POOL_INFO_DATA_DELAY=3600000

REWARD_KOIOS_BASE_URL_ENABLED=false
REWARD_KOIOS_BASE_URL=https://api.koios.rest/api/v0/

# Schedule
SCHEDULE_HOSTNAME=explorer-schedule
SCHEDULE_PORT=8768
SCHEDULE_SPRING_PROFILES_ACTIVE=dev,koios,sentinel,minio
SCHEDULE_FLYWAY_ENABLE=true
SCHEDULE_FLYWAY_VALIDATE=false
SCHEDULE_SCHEMA=mainnet

SCHEDULE_MAXIMUM_POOL_SIZE=48
SCHEDULE_META_DATA_JOB_ENABLED=true
SCHEDULE_REPORT_HISTORY_JOB_ENABLED=false
SCHEDULE_EXPIRED_REPORTS_RATE=604800000
SCHEDULE_POOL_OFFLINE_DATA_JOB_ENABLED=true
SCHEDULE_CRAWL_POOL_DATA_DELAY=172800000
SCHEDULE_INSERT_POOL_DATA_DELAY=180000
SCHEDULE_SET_EXPIRED_REPORTS_DELAY=86400000
SCHEDULE_LIMIT_CONTENT_PER_SHEET=1000000

SCHEDULE_TOKEN_METADATA_URL=https://github.com/input-output-hk/metadata-registry-testnet.git
SCHEDULE_TOKEN_METADATA_FOLDER=/registry
SCHEDULE_API_CHECK_REWARD_URL=http://explorer-reward:8767/api/v1/rewards/fetch
SCHEDULE_API_CHECK_POOL_HISTORY_URL=http://explorer-reward:8767/api/v1/pool-history/fetch
SCHEDULE_NETWORK_NAME=mainnet

SCHEDULE_KAFKA_GROUP_ID=mainnet
SCHEDULE_KAFKA_REPORTS_TOPIC=dev.explorer.api.mainnet.reports
SCHEDULE_KAFKA_CONFIGURATION_ENABLED=true
SCHEDULE_S3_REGION=null
SCHEDULE_S3_BUCKET_NAME=cardano-explorer-api-storage-mainnet
SCHEDULE_S3_PATH_STYLE_ENABLED=true

SCHEDULE_TOKEN_INFO_JOB_ENABLED=false
SCHEDULE_TOP_DELEGATORS_FIXED_DELAY=300000
SCHEDULE_TOKEN_PAGE_CACHE_FIXED_DELAY=100000
SCHEDULE_TOKEN_PAGE_CACHE_TTL=200000
SCHEDULE_POOL_STATUS_FIXED_DELAY=120000
SCHEDULE_NUMBER_DELEGATOR_FIXED_DELAY=120000
SCHEDULE_UNIQUE_ACCOUNT_FIXED_DELAY=300000
SCHEDULE_UNIQUE_ACCOUNT_ENABLED=true

SCHEDULE_TOKEN_INFO_FIXED_DELAY=60000

# API
API_HOSTNAME=explorer-api
API_PORT=8080
API_SPRING_PROFILES_ACTIVE=dev,koios,sentinel,minio
API_DB_SCHEMA=mainnet
API_DB_MAX_POOL_SIZE=80
API_KAFKA_REPORTS_TOPIC=dev.explorer.api.mainnet.reports

API_S3_BUCKET_NAME=cardano-explorer-api-storage-mainnet
API_S3_REGION=null
API_CHECK_POOL_HISTORY_URL=http://explorer-reward:8767/api/v1/pool-history/fetch
API_CHECK_POOL_INFO_URL=http://explorer-reward:8767/api/v1/pool-info/fetch
API_CHECK_EPOCH_STAKE_URL=http://explorer-reward:8767/api/v1/epoch-stake/fetch
API_CHECK_ADA_POTS_URL=http://explorer-reward:8767/api/v1/ada-pots/fetch
API_CHECK_REWARD_URL=http://explorer-reward:8767/api/v1/rewards/fetch
API_CHECK_EPOCH_URL=http://explorer-reward:8767/api/v1/epochs/fetch
API_NEWS_URL="http://dev.cf-explorer-monolith-mainnet.metadata.dev.cf-deployments.org:8085/?amount=%d"
API_NEWS_CACHE_TIME=120
API_MARKET_URL="https://api.coingecko.com/api/v3/coins/markets?ids=cardano&vs_currency=%s"
API_MARKET_CACHE_TIME=120
API_EPOCH_DAYS=5
API_REPORT_LIMIT_PER_24HOURS=100

# Authenticaion
AUTHENTICATION_HOSTNAME=explorer-authentication
AUTHENTICATION_PORT=8021
AUTHENTICATION_EXTERNAL_PORT=8021
AUTHENTICATION_SPRING_PROFILES_ACTIVE=dev,sentinel
AUTHENTICATION_DB_SCHEMA=public

AUTHENTICATION_FLYWAY_ENABLED=true
AUTHENTICATION_SWAGGER_CLIENT_URL=http://{MY_IPV4}:7276
AUTHENTICATION_SWAGGER_SERVER_URL=http://{MY_IPV4}:8021

# Frontend
FRONTEND_HOSTNAME=explorer-frontend
FRONTEND_PORT=7276
REACT_APP_NETWORK=mainnet
REACT_APP_JSD_WIDGET_KEY=9b9fab2d-676f-4359-a824-36cb99c247c1
REACT_APP_EXT_ADA_PRICE_URL=https://www.coingecko.com/en/coins/cardano
REACT_APP_API_URL=http://{MY_IPV4}:8080/api/v1
REACT_APP_AUTH_API_URL=http://{MY_IPV4}:8021/api/v1
REACT_APP_CARDANO_NEWS_URL=https://cardanofoundation.org/en/news/
REACT_APP_PREPROD_APP_URL={MY_IPV4}:7276
REACT_APP_MAINNET_APP_URL={MY_IPV4}:7276
REACT_APP_NETWORK_NAMES='{"mainnet":"Mainnet","preprod":"Preprod"}'
