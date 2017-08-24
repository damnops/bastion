FROM alpine
MAINTAINER "TOC" <tw-toc@thoughtworks.com>

RUN apk update \
 && apk add bash \
            openssh \
            util-linux \
            augeas \
 && rm -rf /var/cache/apk/*

COPY etc/motd \
     etc/profile \
     etc/lists \
     /etc/

COPY bin/getlogin \
     bin/replay \
     bin/useradd \
     /usr/local/bin/

COPY bin/entrypoint \
     bin/prepare \
     /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]``