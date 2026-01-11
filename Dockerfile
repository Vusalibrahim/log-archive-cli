FROM alpine:3.20

RUN apk add --no-cache bash tar coreutils

COPY log-archive /usr/local/bin/log-archive
RUN chmod +x /usr/local/bin/log-archive

ENTRYPOINT ["/usr/local/bin/log-archive"]