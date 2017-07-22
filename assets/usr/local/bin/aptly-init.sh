#!/bin/sh

# dummy repository for aptly serve
if [ ! -d /aptly-data/public ]; then
  aptly repo create -architectures='amd64' --comment='Sandbox' -distribution='xenial' -component='main' sandbox && \
  aptly publish repo -architectures='amd64' -skip-signing sandbox sandbox
fi

aptly api serve -listen=:8081 -no-lock=true &
aptly serve -listen=:8080 &

while true
do
  sleep 60
done
