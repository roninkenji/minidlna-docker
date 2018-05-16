FROM alpine:latest
MAINTAINER Kenneth Tan <github@way-of-the-blade.com>

RUN apk -U add minidlna

COPY docker_init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker_init.sh

ENTRYPOINT ["/usr/local/bin/docker_init.sh"]
