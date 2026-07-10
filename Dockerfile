FROM redis:7-alpine

ENV REDIS_CONF_FILE="/usr/local/etc/redis/redis.conf"
ENV REDIS_MAX_MEMORY="8000000000"

COPY ./build /build
RUN mv /build/scripts /scripts && \
  mkdir -p /usr/local/etc/redis && \
  mv /build/conf/redis.conf "$REDIS_CONF_FILE"

ENTRYPOINT /scripts/run.sh

# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="redis" \
  org.opencontainers.image.title="digitalrepository.redis.lib.unb.ca" \
  org.opencontainers.image.description="digitalrepository.redis.lib.unb.ca is the redis application serving digitalrepository instances at UNB Libraries." \
  org.opencontainers.image.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.source="https://github.com/unb-libraries/digitalrepository.redis.lib.unb.ca" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.created="$BUILD_DATE"