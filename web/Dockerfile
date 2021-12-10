ARG JITSI_REPO=jitsi
ARG BASE_TAG=latest
FROM ${JITSI_REPO}/base:${BASE_TAG}

ADD https://raw.githubusercontent.com/acmesh-official/acme.sh/2.8.8/acme.sh /opt
COPY rootfs/ /

# assure that jitsi-meet-web_1.0.1-1_all.deb and jitsi-meet-web-config_1.0.1-1_all.deb are copied from
# the jitsi-meet build into this directory!!!

COPY jitsi-meet-web_*.deb /
COPY jitsi-meet-web-config_*.deb /

RUN apt-dpkg-wrap apt-get update && \
    apt-dpkg-wrap apt-get install -y cron nginx-extras socat && \
    dpkg -i /jitsi-meet-web_*.deb && \
    dpkg -x /jitsi-meet-web-config*.deb /tmp/pkg && \
    mv /tmp/pkg/usr/share/jitsi-meet-web-config/config.js /defaults && \
    mv /usr/share/jitsi-meet/interface_config.js /defaults && \
    rm -f /etc/nginx/conf.d/default.conf && \
    apt-cleanup && \
    rm -rf /tmp/pkg /var/cache/apt

EXPOSE 80 443

VOLUME ["/config", "/usr/share/jitsi-meet/transcripts"]
