FROM alpine:3.10
COPY bin/ /opt/bin/
COPY template/ /opt/template/
RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update \
    && apk add --no-cache bash curl jq  \
    && rm -rf /var/cache/apk/* \
    && chmod 765 -R /opt/bin/
ENTRYPOINT ["/opt/bin/entrypoint.sh"]

