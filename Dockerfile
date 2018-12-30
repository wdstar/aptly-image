FROM debian:stable-slim

ADD assets/etc/aptly.conf /etc/
ADD assets/usr/local/bin/aptly-init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/aptly-init.sh && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates gnupg dirmngr && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9E3E53F19C7DE460 && \
    apt-get update && \
    apt-get install -y --no-install-recommends aptly curl && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /aptly-data && \
    mkdir -p /root/.gnupg && \
    chmod 700 /root/.gnupg

VOLUME ["/root/.gnupg"]

ENTRYPOINT /usr/local/bin/aptly-init.sh

EXPOSE 8080 8081
