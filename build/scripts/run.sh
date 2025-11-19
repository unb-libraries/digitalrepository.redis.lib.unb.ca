#!/usr/bin/env sh
sed -i "s|REDIS_MAX_MEMORY|$REDIS_MAX_MEMORY|g" "$REDIS_CONF_FILE"

redis-server "$REDIS_CONF_FILE"