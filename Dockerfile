FROM alpine:3.8
ENV HTTP_PORT=3128 \
    CACHE_SIZE=1024 \
    CACHE_MEM="1 MB" \
    MAX_OBJECT_SIZE="1 GB" \
    MAX_OBJECT_SIZE_IN_MEM="512 KB"
RUN mkdir /squid && chmod 1777 /squid
COPY bin /squid/bin
COPY config /squid/config
COPY certs /squid/certs
COPY apks /tmp/apks
RUN apk add \
    --no-network \
    --allow-untrusted \
    /tmp/apks/*
EXPOSE 3128
#ENTRYPOINT ["/squid/bin/entrypoint"]
