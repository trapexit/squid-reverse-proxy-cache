FROM alpine:3.8
RUN mkdir /squid && chmod 1777 /squid
COPY entrypoint /squid/bin/entrypoint
COPY config /squid/config
COPY certs /squid/certs
COPY apks /tmp/apks
RUN apk add \
    --no-network \
    --allow-untrusted \
    /tmp/apks/*
EXPOSE 3128
ENTRYPOINT ["/squid/bin/entrypoint"]
