FROM redis:7-alpine

ENV REDIS_CONF_FILE /usr/local/etc/redis/redis.conf
ENV REDIS_MAX_MEMORY 8000000000

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
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="MIT" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="digitalrepository.redis.lib.unb.ca is the redis application serving digitalrepository instances at UNB Libraries." \
  org.label-schema.name="digitalrepository.redis.lib.unb.ca" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/unb-libraries/digitalrepository.redis.lib.unb.ca" \
  org.label-schema.vendor="University of New Brunswick Libraries" \
  org.label-schema.version=$VERSION \
  org.opencontainers.image.source="https://github.com/unb-libraries/digitalrepository.redis.lib.unb.ca"